tic;
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

% assignWeightsQ;
% [max_weight index_max_weight] = max(weight);
% disp(['current estimation: ', num2str(pos(index_max_weight, :))]);
% scatter(pos(index_max_weight, 1), pos(index_max_weight, 2), 7, 'r');
    
hold off;
iterations = 0;
last_shift = false;

while(true)
    
%     if(iterations > 0)
%         best_ang = ang(index_max_weight);
%         ang = ang.*0;
%         ang = ang + best_ang;
%     end
    
%     figure();
%     hold on;
%     drawMap;
%     drawBot;
%     hold off;
        
    for nmovs = 1:1
        scan;
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
    
    figure();
    hold on;
    drawMap;
    drawBot;
    hold off;
    
    assignWeightsQ;
    quickSortP;
    
    rouletteSelection;
    
    close all;
    
    figure();
    hold on;
    drawMap;
    drawBot;
    
    
    assignWeightsQ;
    stdX = std(pos(:,1))
    stdY = std(pos(:,2))
%     sum(min_err_shift)
%     min(min_err_shift)
    if(stdX < 6 || stdY < 6)
        break;
    end
    iterations = iterations + 1;
    [max_weight index_max_weight] = max(weight);
    disp(['current estimation: ', num2str(mean(pos,1))]);
    scatter(pos(index_max_weight, 1), pos(index_max_weight, 2), 7, 'r');
%     estim_pos = [bsxfun(@times, pos(:,1), weight) bsxfun(@times, pos(:,2), weight)];
%     estim_pos = sum(estim_pos, 1)./ sum(weight)
%     disp(['better estimation: ', num2str(estim_pos)]);
%     scatter(estim_pos(1), estim_pos(2), 12, 'm');
    hold off;
    
end
toc;
last_shift = true;
oldWeight = weight;
oldPos = pos;
oldAng = ang;


'best'
ang = ang(index_max_weight)
pos = pos(index_max_weight, :)
figure();
hold on;
drawMap;
option = 3;
drawBot;
'mean'
ang = mean(oldAng)
pos(1,1) = mean(oldPos(:, 1))
pos(1,2) = mean(oldPos(:, 2))
drawBot;
'min'
ang = min(oldAng)
pos(1,1) = min(oldPos(:, 1))
pos(1,2) = min(oldPos(:, 2))
drawBot;
'max'
ang = max(oldAng)
pos(1,1) = max(oldPos(:, 1))
pos(1,2) = max(oldPos(:, 2))
drawBot;
'last'
nparticles = 1;
scan;
correctShiftQ;
ang = ang(index_max_weight)
pos = pos(index_max_weight, :)
drawMap;
hold off;


CloseSensor(port);
% Close Bluetooth connection.
COM_CloseNXT(handle);