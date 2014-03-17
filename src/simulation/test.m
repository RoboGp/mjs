%  clf;
%  clc;
%  clear all;
%  
%  map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];
%  hold on;
%  axis equal;
%  
%  theta = degtorad(45);
%  distance = 100;
%  
%  x = 20;
%  y = 40;
%  
%  nscans = 20;
%  
%  robot = BotSim(map);
%  robot.setBotPos([x y]);
%  robot.setBotAng(theta);
%  robot.weight = 0;
%  robot.distance = zeros(nscans, 1);
%  robot.o_distance = zeros(nscans, 1); 
%  robot.setScanConfig(robot.generateScanConfig(nscans));  %sets the scan configuration on the botSim.  
%  
%  robot.drawMap();
%  robot.drawBot(3);
%  
%  angle = robot.getBotAng() + theta;
%  dir = [cos(angle) sin(angle)];
%  
%  pos = robot.getBotPos();
%  
%  pos = pos + (dir * distance);
%  pos
%  result = inpolygon(pos(1), pos(2), robot.inpolygonMapformatX, robot.inpolygonMapformatY);
%  
%  result
%  
%  plot(pos(1), pos(2), 'r.','MarkerSize',20)
%  
%  robot.turn(theta);
%  robot.move(distance);
%  robot.getBotPos()
%  
%  robot.drawBot(3);

  clc
%    map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];
%  
%    inpolygonMapformatX = cat(1, map(:,1), map(1,1));
%    inpolygonMapformatY = cat(1,map(:,2), map(1,2));
%    
%    'before'
%    map
%    map(length(map)+1,:)= map(1,:);
%    'after'
%    map
%    
%    '------------'
%    map_lines = zeros(length(map)-1,4);
%    for i =1:size(map_lines,1)
%      map_lines(i,:) = [map(i,:) map(i+1,:)] ;
%    end
%    
%    map_lines
%    
%    
%    
%    
%    innerRad = 0;
%    outerRad = 1;
%    pos = [20 40];
%    
%    ang = pi;
%    scanOffset = [0 0];
%    scanConfig = generateScanConfig(20);
%  
%    transMat = createTransMat(pos) * createRotMat(ang) * createTransMat(scanOffset);
%      
%    scanCenter = translate(scanConfig*innerRad, transMat);
%    
%    
%    scans =  translate(scanConfig*outerRad, transMat);
%    scans
%    scanLines = cat(2, scanCenter, scans);
%    scanLines


movedist = 10;
delta_angle = pi/2;

botpos = zeros(1, 2);
botang = r_ang;
botpos(1, :) = r_pos(1, :);

turn;
move;

figure()
  hold on;
  drawMap;

r_pos(1, :) = botpos(1, :);
r_ang = botang;
r_dir(1, :) = botdir(1, :);

  option = DRAW_ROBOT;
  drawBot;
