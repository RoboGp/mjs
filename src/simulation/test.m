clf;
clc;
clear all;

map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];
hold on;
axis equal;

theta = degtorad(45);
distance = 100;

x = 20;
y = 40;

nscans = 20;

robot = BotSim(map);
robot.setBotPos([x y]);
robot.setBotAng(theta);
robot.weight = 0;
robot.distance = zeros(nscans, 1);
robot.o_distance = zeros(nscans, 1); 
robot.setScanConfig(robot.generateScanConfig(nscans));  %sets the scan configuration on the botSim.  

robot.drawMap();
robot.drawBot(3);

angle = robot.getBotAng() + theta;
dir = [cos(angle) sin(angle)];

pos = robot.getBotPos();

pos = pos + (dir * distance);
pos
result = inpolygon(pos(1), pos(2), robot.inpolygonMapformatX, robot.inpolygonMapformatY);

result

plot(pos(1), pos(2), 'r.','MarkerSize',20)

robot.turn(theta);
robot.move(distance);
robot.getBotPos()

robot.drawBot(3);