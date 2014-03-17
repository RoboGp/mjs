%{
Robot simulator V0.03
If you have any suggestions for fixes or improvements contact Austin Gregg-Smith ag7751@bristol.ac.uk
%}

classdef BotSim < handle
    % The following properties can be set only by class methods
    properties (SetAccess = private,GetAccess = private)
        map;    %map coordinates with a copy of the first coordiantes at the end
        pos;    %position of the robot
        ang;    %angle of the robot (radians)
        dir;    %angle of the robot (stored as 2D unit vector)
	
    end
    %public properties
    properties
	mapLines;   %The map stored as a list of lines (for easy line interection)
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
        
        
        
        function inside = insideMap(bot)
            %Tests if the bot is currently inside the map.
            %Uses the inbuilt inpolygon function
            inside = inpolygon(bot.pos(1),bot.pos(2),bot.inpolygonMapformatX,bot.inpolygonMapformatY);
        end
        
        
        
      
        function mapOut =getMap(bot)
            mapOut = bot.unmodifiedMap;
        end
        
        function drawScanConfig(bot)
            drawLines(bot.scanLines,'g');
        end
    end
end