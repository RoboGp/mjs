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

for niterations = 1:2
  figure();
  hold on;
  drawMap;
  
  moveAll;
  option = DRAW_ROBOT;
  drawBot;

  disp(['Iteration == ' num2str(niterations) '==== ' num2str(r_pos(1)) '  ' num2str(r_pos(2)) '  angle  ' num2str(r_ang) ' sdist: ' num2str(sdist)])
  
  if(r_pos(1) == 5 && r_pos(2) == 5)
    break;
  end
  
  pause(1);
  hold off;
end
%  for iterations = 1:50
%    scan;
%      
%    correctShift;
%    
%    assignWeights;
%    quickSortP;
%  
%    rouletteSelection;
%    assignWeights;
%  
%    figure();
%    hold on;
%    drawMap;
%    
%    moveAll;
%    
%    option = DRAW_ROBOT;
%    drawBot;
%    
%    option = DRAW_PARTICLE;
%    part_pos = zeros(1, 2);
%    for ind = 1:nparticles
%      part_pos(1) = pos(ind, 1) + (rand()/2 - rand()/2);
%      part_pos(2) = pos(ind, 2) + (rand()/2 - rand()/2);
%      
%      inside = inpolygon(part_pos(1), part_pos(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
%      if(inside)
%        pos(ind, :) = part_pos(1, :);
%      end
%    end
%    drawBot;
%  
%    hold off;
%  %    close all;
%    ['iteration over']
%  end

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
