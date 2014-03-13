clf;
clc;
clear all;

map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];
hold on;
axis equal;

%---------------------------------------------------
% GLOBAL VARIABLES
%---------------------------------------------------
nscans = 360;
nparticles = 10;
check = 0;

[robot particle] = init(20, 40, 0, nscans, nparticles, map);

%  for i = 1:inf
  scan(robot, particle, nparticles);

%    figure();
%    hold on;
%    robot.drawMap();
%    robot.drawBot(3);
  
  correctShift(robot, particle, nscans, nparticles);
%    [robot.distance particle(1).o_distance]
%    particle(1).drawScanConfig();  %draws the scan configuration to verify it is correct      
%    particle(2).drawScanConfig();  %draws the scan configuration to verify it is correct      


  
%    assignWeights(robot, particle, nscans, nparticles);
%  
%    quickSortP(particle, 1, nparticles);
%    rouletteSelection(particle, nparticles);
%    
%    check = checkConvg(particle, nparticles);
%  end
%  
%  %---------------------------------------------------
%  % PART II
%  %---------------------------------------------------
%  nrows = size(map);
%  visgraph = zeros(nrows(1)+1, nrows(1)+1);
%  
%  for c = 1:nrows(1)
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
