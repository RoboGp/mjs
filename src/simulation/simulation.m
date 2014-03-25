clc;
clear all;

hold on;
axis equal;

%---------------------------------------------------
% Initialisations
%---------------------------------------------------
tic
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

iterations = 0;
scan;
  correctShift;
for iterations = 1:100

  for nmovs = 1:1
    moveAll;
    scan;
    correctShift;
  end

  if(mod(iterations, 20) == 0)
    close all;
  end
    

  assignWeights;
  sortParticles;
  
  particleSelection;
  assignWeights;
  
  drawAll;
  checkConvg;
end
toc
%    
%    
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
