map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];
hold on;
axis equal;

robot = BotSim(map);
robot.setBotPos([20 40]);
robot.setBotAng(degtorad(90));

robot.getBotPos()

jay = BotSim(map);
jay.setBotPos([200 400]);
jay.setBotAng(degtorad(90));


temp = jay;
jay = robot;
robot = temp;

robot.getBotPos()