clf;
clc;
clear all;

map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];
hold on;
axis equal;

%---------------------------------------------------
% GLOBAL VARIABLES
%---------------------------------------------------
nscans = 20;
nparticles = 1;

[robot particle] = init(20, 40, theta, nscans, nparticles);
scan(robot, particle, nparticle);

correctShift(robot, particle, nscans, nparticles);
assignWeights(robot, particle, nscans, nparticles);

quickSort(particle, 0, nparticles);
rouletteSelection(particle, nparticles);

