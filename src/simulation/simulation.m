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

iterations = 0;

scan;
correctShift;
drawAll;

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
  
  if(done)
    break;
  end
end

[fval findex] = max(weight);
fpos = pos(findex, :);
fang = ang(findex);
fdir = dir(findex, :);

moveToGoal;
toc