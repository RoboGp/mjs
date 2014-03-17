%---------------------------------------------------
% INITIALISATION
%---------------------------------------------------

setMap;
drawMap;

% Initialise Robot
r_pos = [100 80];
r_ang = degtorad(90);
r_dir = [cos(r_ang) sin(r_ang)];

option = DRAW_ROBOT;
drawBot;

% Iniitialise Particles
scanOffset = [0 0];
generateScanConfig;			% sets scanConfig

sensorNoise = 0;  %constant noise model. Error standard deviation in cm
motionNoise = 0;  %proportional noise model. cm error stdDev per unit length in cm/cm
turningNoise = 0; %porportional noise model. Radian stdDev error per radian rad/rad


option = DRAW_PARTICLE;
min_wall_dist = 5;

newRandomPose;
%  weight = 0;
drawBot;

