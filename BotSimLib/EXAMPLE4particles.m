clf;
clc;
clear all;

map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];

disp('This example shows a simple procedure for updating your particles');
disp('First create a vector with N botSim object, one for each particle');

num =200;
botSim = BotSim(map);
hold on;
botSim.drawMap();
axis equal;
for i =1:num
    particles(i) = BotSim(map);
    particles(i).randomPose(5); %at least 5cm from the wall
    particles(i).drawBot(3);
end

hold off;
botSim.drawMap();
hold on;
axis equal;

input('Press enter to send the same movement commands to each particle');
for i =1:num
    particles(i).turn(0.1);
    particles(i).move(20);
    particles(i).drawBot(3);
end

input('Remove bots outside the map and generate a new random particle');
clf
hold off;
botSim.drawMap();
hold on;
axis equal;
for i =1:num    
    if particles(i).insideMap() == 0
        particles(i).randomPose(5);
    end
    particles(i).drawBot(3);
end
