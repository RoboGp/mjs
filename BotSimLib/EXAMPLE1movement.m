%{
When writing your code please use this class to simulate the
behavior of the robot. Below is an example of how the botSim class should be used.
%}
clf;        %clears figures
clc;        %clears console
clear;      %clears workspace
hold on;
axis equal; %keeps the x and y scale the same
map=[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];  %default map

botSim = BotSim(map);  %sets up a botSim object a map

disp('You can set the angle and position of the robot');
botSim.setBotPos([20 40]);
botSim.setBotAng(pi/3);

%you can access and print the current position and angle
botPosition = botSim.getBotPos()
botAngle = botSim.getBotAng()

%--------------------------------------------------------------------------------------
botSim.drawMap();
botSim.drawBot(3);

input('Press enter to make the robot move forward 10cm');
botSim.move(10);


botSim.drawBot(3);

input('Press enter to make the robot turn 45deg and move forward 10cm');
botSim.turn(pi/4);
botSim.move(10);
botSim.drawBot(3);

input('Press enter to make the robot turn 45deg and move forward 30cm');
botSim.turn(pi/4);
botSim.move(30);
botSim.drawBot(3);
disp('Note how the robot is able to leave the arena, no collision checking')
disp('is performed.  You can call botSim.insideMap() to check this:')
insideMap = botSim.insideMap()

input('Press enter to turn 180 degree and move forward 10cm')
botSim.turn(pi);
botSim.move(10);
botSim.drawBot(3);

disp('The insideMap function now returns 1')
insideMap = botSim.insideMap()