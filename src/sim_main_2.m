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

%---------------------------------------------------
% INITIALISATION
%---------------------------------------------------
% Initialise robot
robot = BotSim(map);
robot.setBotPos([20 40]);
robot.setBotAng(pi);

robot.setScanConfig(robot.generateScanConfig(20));  %sets the scan configuration on the botSim.  

robot.drawMap();
robot.drawBot(3);

% Initialise nparticles
nparticles = 1;
pweight = zeros(nparticles);

for i = 1:nparticles
    particle(i) = BotSim(map);
    particle(i).randomPose(5); %at least 5cm from the wall
    particle(i).drawBot(3);
    particle(i).setScanConfig(particle(i).generateScanConfig(nscans));
end


%---------------------------------------------------
% 18 SCANS (360deg) with a 20deg gap.
%---------------------------------------------------
[r_distance crossingPoint]  = robot.ultraScan();
distance = zeros(nscans, nparticles);

for i = 1:nparticles
  [distance(:, i) cp]  = particle(i).ultraScan();
end


%---------------------------------------------------
% FIND THE BEST SHIFTED HISTOGRAM
% Get the histogram of particle(i) with the best overlap as 
% the robot's histogram
%---------------------------------------------------
o_distance = zeros(nscans, nparticles);
for j = 1:nparticles
  min_err = inf;
  for i = 1:nscans
    diff = r_distance - distance(1, j);
    diff = diff.*diff;
    sq_err = sum(diff);
    
    if(sq_err < min_err) 
      min_err = sq_err;
      o_distance(1, j) = distance(1, j);
    end

    distance(1, j) = circshift(distance(1, j), 1);
  end
end


%---------------------------------------------------
% FIND LIKELIHOOD OF EACH PARTICLE'S POSITION
% Apply gaussian = 18 likelihoods
% Weight of particle = Average of 18 readings.
%---------------------------------------------------
likelihood = zeros(nscans, nparticles);
for j = 1:nparticles
  for i = 1:nscans
    likelihood(i, j) = gaussmf(o_distance(i, j), [3 r_distance(i)]);
  end
  weight(j) = mean(likelihood)
end


% Resampling
