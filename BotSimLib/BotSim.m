%{
Robot simulator V0.03
If you have any suggestions for fixes or improvements contact Austin Gregg-Smith ag7751@bristol.ac.uk
%}

classdef BotSim < handle
    % The following properties can be set only by class methods
    properties (SetAccess = private,GetAccess = private)
        map;    %map coordinates with a copy of the first coordiantes at the end
        mapLines;   %The map stored as a list of lines (for easy line interection)
        pos;    %position of the robot
        ang;    %angle of the robot (radians)
        dir;    %angle of the robot (stored as 2D unit vector)
	
    end
    %public properties
    properties
        unmodifiedMap;  %stores the map in the default format provided on the course
        scanOffset;     %stores the offset of center of rotation of the simulated ultrasound
        scanConfig;     %stores how the robot performs a scan (number of points, angle between points)
        scanLines;      %the scan configuration stored as 2d lines
        sensorNoise     %Error standard deviation in cm
        motionNoise     %cm error stdDev per unit length in cm/cm
        turningNoise    %Radian stdDev error per radian rad/rad
        inpolygonMapformatX; %The map stored as a polygon for the insidepoly function
        inpolygonMapformatY; %The map stored as a polygon for the insidepoly function
	weight;
	distance;
	o_distance;
	cp;		% Crossing point

    end
    
    methods
        %Constructor
        function bot = BotSim(newMap,noiseLevel)
            if nargin <2
                noiseLevel = [0 0 0];
            end
            bot.pos = [0 0];
            bot.ang = 0;
            bot.dir = [cos(bot.ang) sin(bot.ang)];
            bot.setMap(newMap);
            bot.scanOffset = [0 0];
            bot.scanConfig = [30 0];
            bot.updateScanLines(0,1);
            bot.sensorNoise = noiseLevel(1);  %constant noise model. Error standard deviation in cm
            bot.motionNoise = noiseLevel(2);  %proportional noise model. cm error stdDev per unit length in cm/cm
            bot.turningNoise = noiseLevel(3); %porportional noise model. Radian stdDev error per radian rad/rad
        end
        
        %% actions
        function move(bot,distance)
            %moves the bot forward by a distance in the direction its
            %facing.  noise is added proportional to the distance moved. A
            %constant amount of angular noise is added
            bot.ang = bot.ang + randn(1)*bot.turningNoise;
            bot.dir = [cos(bot.ang) sin(bot.ang)];
            bot.pos = bot.pos + bot.dir*(distance+(distance*randn(1)*bot.motionNoise));
            bot.updateScanLines(0,1);
        end
        
        function turn(bot,deltaAngle)
            %turns the robot by an angle and adds noise proportional to the
            %amount turned
            bot.ang = bot.ang + deltaAngle+ deltaAngle*randn(1)*bot.turningNoise;
            bot.dir = [cos(bot.ang) sin(bot.ang)];
            bot.updateScanLines(0,1);
        end
        
        function [distances crossingPoints] = ultraScan(bot)
            %ultraScan simulates the ultrasound scan.  Returns a vector of
            %distances to the walls with the respective crossing points
            cps = zeros(length(bot.mapLines),2,length(bot.scanLines)); %crossingPoints
            distances = zeros(size(bot.scanLines,1),1);
            crossingPoints = zeros(size(bot.scanLines,1),2);
            botpos = repmat(bot.pos,length(bot.mapLines),1); %preallocate for speed
            for i =1:size(bot.scanLines)
                cps(:,:,i) = intersection(bot.scanLines(i,:),bot.mapLines)+randn(length(bot.mapLines),2)*bot.sensorNoise;
                distSQ =sum((cps(:,:,i) - botpos).^2,2);
                [distances(i,:) indices] = min(distSQ);
                distances(i,:) = sqrt(distances(i,:)); % only do sqrt once instead of on the entire vector
                crossingPoints(i,:) = cps(indices,:,i);
            end
        end
        
        function randomPose(bot,minDistance)
            %moves the robot to a random position and orientation a minimum
            %distance away from the walls
            bot.pos = bot.getRndPtInMap(minDistance);
            bot.ang = 2*pi*rand(1);
            bot.dir = [cos(bot.ang) sin(bot.ang)];
            bot.updateScanLines(0,1);
        end
        
        %%  general functions
        function updateScanLines(bot,innerRad,outerRad)
            %needs to be called after the robot has moved or turned.  This
            %updates the scanLine vectors.  The inner and outer rad set how
            %the scanlines are drawn and do not affect the operation of the
            %program, Don't set them both to 0 however.
            transMat = createTransMat(bot.pos)*createRotMat(bot.ang)*createTransMat(bot.scanOffset);
            scanCenter = translate(bot.scanConfig*innerRad, transMat);
            scans =  translate(bot.scanConfig*outerRad,transMat);
            bot.scanLines = cat(2,scanCenter, scans);
        end
        
        function inside = insideMap(bot)
            %Tests if the bot is currently inside the map.
            %Uses the inbuilt inpolygon function
            inside = inpolygon(bot.pos(1),bot.pos(2),bot.inpolygonMapformatX,bot.inpolygonMapformatY);
        end
        
        function inside = pointInsideMap(bot,points)
            %Tests if a point is currently inside the map.
            %Uses the inbuilt inpolygon function
            inside = inpolygon(points(:,1),points(:,2),bot.inpolygonMapformatX,bot.inpolygonMapformatY);
        end
        
        function point = getRndPtInMap(bot,minimumWallDist)
            %generate random points inside the map bounds and test if they are inside
            %This is probably a terrible way to do this, but it is by far the easiest
            bounds = [max(bot.unmodifiedMap);  min(bot.unmodifiedMap)];
            point =  bounds(1,:) + (bounds(2,:)-bounds(1,:)).*rand(1,2);
            while(~pointInsideMap(bot,point)|| min(disToLineSeg(point,bot.mapLines))< minimumWallDist )
                point =  bounds(1,:) + (bounds(2,:)-bounds(1,:)).*rand(1,2);
            end
        end
        
        function scanConfig = generateScanConfig(bot,samples)
            %generates a simple 360 deg scan configuration.  You can set
            %the number of scans to take.
            %this function could be static but is not for simplicity
            %(no other functions are static and it may be confusing)            
            startAngle =0;
            endAngle = 2*pi;
            i= startAngle:abs(startAngle-endAngle)/samples:startAngle+endAngle- abs(startAngle-endAngle)/samples;
            scanConfig =  cat(1,cos(i), sin(i))'*30;
        end
        
        %% getters and setters
        function setBotPos(bot,value)
            if(length(value) ==2)
                bot.pos = value;
                bot.updateScanLines(0,1);
            else
                error('Expected Vector Length 2')
            end
        end
        
        function botOut =getBotPos(bot)
            botOut =bot.pos;
        end
        
        function setBotAng(bot,value)
            bot.ang = value;
            bot.dir = [cos(bot.ang) sin(bot.ang)];
            bot.updateScanLines(0,1);
        end
        
        function botOut =getBotAng(bot)
            botOut =bot.ang;
        end
        
        function setScanConfig(bot,config,offsets)
            if nargin <3
               offsets = [0 0];
            end
            bot.scanConfig = config;
            bot.scanOffset = offsets;
            bot.updateScanLines(0,1);
        end
        
        function mapOut =getMap(bot)
            mapOut = bot.unmodifiedMap;
        end
        
        function setMap(bot,newMap)
            bot.unmodifiedMap = newMap;
            bot.inpolygonMapformatX = cat(1,newMap(:,1), newMap(1,1));
            bot.inpolygonMapformatY = cat(1,newMap(:,2), newMap(1,2));
            
            newMap(length(newMap)+1,:)= newMap(1,:);
            bot.map = newMap;
            bot.mapLines = zeros(length(bot.map)-1,4);  %each row represents a border of the map
            for i =1:size(bot.mapLines,1)
                bot.mapLines(i,:) = [bot.map(i,:) bot.map(i+1,:)] ;
            end
        end
        
        %% drawing functions
        function drawMap(bot)
            line(bot.map(:,1),bot.map(:,2),'lineWidth',2,'Color','r'); % draws arena
        end
        
        function drawBot(bot,lineLength)
            plot(bot.pos(1),bot.pos(2),'o');
            line([bot.pos(1) bot.pos(1)+bot.dir(1)*lineLength],[bot.pos(2) bot.pos(2)+bot.dir(2)*lineLength]);
        end
        
        function drawScanConfig(bot)
            drawLines(bot.scanLines,'g');
        end
    end
end