close all;
clc;
clear;

hold on;
axis equal;

%---------------------------------------------------
% Initialisations
%---------------------------------------------------
declareGlobals
init

rotateBack = false;
scanSpeed = 15;

COM_CloseNXT all;
handle = COM_OpenNXT();
COM_SetDefaultNXT(handle);

port = SENSOR_2;

OpenUltrasonic(port); %open usensor on port 4
sensorMot = NXTMotor('B');  %motor connected to port C
sensorMot.SmoothStart = true;

leftMot = NXTMotor('C', 'SmoothStart', true, 'ActionAtTachoLimit', 'Brake');
rightMot = NXTMotor('A', 'SmoothStart', true, 'ActionAtTachoLimit', 'Brake');

scan;
iterations = 0;
correctShiftQ;

figure;
hold on;
drawMap;
drawBot;
hold off;
iterations = 0;
while(true)
    
    for nmovs = 1:1
        if(iterations == 0)
            scan;
        end
        %correctShift; %%%%
        moveAll;
        figure();
        hold on;
        drawMap;
        drawBot;
        hold off;
    end
    
    scan;
    correctShiftQ;
    assignWeightsQ;
    quickSortP;
    
    rouletteSelection;
    
    close all;
    
    figure();
    hold on;
    drawMap;
    drawBot;
    hold off;
    
    assignWeightsQ;
    stdX = std(pos(:,1))
    stdY = std(pos(:,2))
    if(stdX < 6 && stdY < 6)
        break;
    end
    iterations = iterations + 1;
end

oldWeight = weight;
oldPos = pos;
oldAng = ang;

[max_weight index_max_weight] = max(weight);
ang = ang(index_max_weight);
pos = pos(index_max_weight, :);
figure();
hold on;
drawMap;
option = 3;
drawBot;
ang = mean(oldAng);
pos(1,1) = mean(oldPos(:, 1));
pos(1,2) = mean(oldPos(:, 2));
drawBot;
ang = min(oldAng);
pos(1,1) = min(oldPos(:, 1));
pos(1,2) = min(oldPos(:, 2));
drawBot;
ang = max(oldAng);
pos(1,1) = max(oldPos(:, 1));
pos(1,2) = max(oldPos(:, 2));
drawBot;
hold off;

%
%    check = checkConvg(particle, nparticles);
%  end
%
%  %---------------------------------------------------
%  % PART II
%  %---------------------------------------------------
%  nrows = length(map);
%  visgraph = zeros(nrows(1)+1, nrows(1)+1);
%
%  for c = 1:nrows
%    ilist = findConnections(robot, c);
%    check = checkValid(robot, robot.map(c,:), ilist);
%
%    if(check == 1)
%      addToGraph(robot, c, visgraph);
%    end
%  end
%
%  path = astar(visgraph);
%
%

CloseSensor(port);
% Close Bluetooth connection.
COM_CloseNXT(handle);