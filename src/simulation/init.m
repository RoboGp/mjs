%---------------------------------------------------
% INITIALISATION
%---------------------------------------------------


% Initialise Robot
r_pos = [20 20];
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

pos = plot_point;
ang = zeros(nparticles, 1);
dir = zeros(nparticles, 2);

angle = rand(nparticles, 1) * 360;
angle = round(angle);
ang = degtorad(angle);

dir = [cos(ang) sin(ang)];

drawBot;
