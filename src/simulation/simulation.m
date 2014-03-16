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


  for i = 1:1
    scan(robot, particle, nparticles);
    
    
%      correctShift(robot, particle, nscans, nparticles);
%      total_weight = assignWeights(robot, particle, nscans, nparticles);
%      new_particle = quickSortP(particle, nparticles);
%    
%      running_sum = 0;
%      c_sum = zeros(nparticles, 1);
%      
%      for j = 1:nparticles
%        running_sum = running_sum + particle(j).weight;
%        c_sum(j) = running_sum;
%      end
%      running_sum
%      c_sum
%  %      
%      'After Roulette Selection'
%  %      particle = rouletteSelection(particle, nparticles, nscans, map);
%  %      total_weight = assignWeights(robot, particle, nscans, nparticles);
%  
%      figure();
%      hold on;
%      robot.drawMap();
%  %      robot.drawBot(3);
%      
%      moveAll(robot, particle, nparticles);
%      robot.drawBot(3, 1);
%      
%      for j = 1:nparticles
%        particle(j).drawBot(3, 0);
%      end
%    
%      hold off;
  end

  
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
