clf;
clc;
clear all;

hold on;
axis equal;

%---------------------------------------------------
% Initialisations
%---------------------------------------------------
declareGlobals
init

%  for z = 1:10
%    figure();
%    hold on;
%    drawMap;
%    
%    moveAll;
%    option = DRAW_ROBOT;
%    drawBot;
%  
%    hold off;
%  end
for i = 1:10
  scan;
  
  correctShift;
  
  assignWeights;
  quickSortP;

  rouletteSelection;
  
  assignWeights;

  figure();
  hold on;
  drawMap;
  
  moveAll;
  
  option = DRAW_ROBOT;
  drawBot;

  option = DRAW_PARTICLE;
  for ind = 1:nparticles
    pos(ind, 1) = pos(ind, 1) + (rand()/2 - rand()/2);
    pos(ind, 2) = pos(ind, 2) + (rand()/2 - rand()/2);
  end
  drawBot;

  hold off;
end

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
