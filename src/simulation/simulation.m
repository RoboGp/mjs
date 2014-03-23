clc;
clear all;

hold on;
axis equal;

%---------------------------------------------------
% Initialisations
%---------------------------------------------------
declareGlobals
init

%  for niterations = 1:20
%    figure();
%    hold on;
%    drawMap;
%    
%    moveAll;
%    option = DRAW_ROBOT;
%    drawBot;
%  
%    disp(['Iteration == ' num2str(niterations) '==== ' num2str(r_pos(1)) '  ' num2str(r_pos(2)) '  angle  ' num2str(r_ang) ' sdist: ' num2str(sdist)])
%    
%    if(r_pos(1) == 5 && r_pos(2) == 5)
%      break;
%    end
%    
%  %    pause(1);
%    hold off;
%  end
for iterations = 1:100
  scan;
  correctShift;

  assignWeights;
  sortParticles;
  
  particleSelection;
  assignWeights;

  for nmovs = 1:1
    moveAll;
  end

  if(mod(iterations, 20) == 0)
    close all;
  end
  
  drawAll;
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
