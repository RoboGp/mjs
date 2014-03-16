%---------------------------------------------------
% configuration variables
%---------------------------------------------------
nscans = 360;
nparticles = 200;


%---------------------------------------------------
% MAP variables
%---------------------------------------------------
map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];

%The map stored as a list of lines (for easy line interection)
map_lines = zeros(length(map), 4);  		%each row represents a border of the map

%inpolygon.... stores (0,0) twice.
inpolygonMapformatX = zeros(length(map)+1, 1);	%The map stored as a polygon for the insidepoly function
inpolygonMapformatY = zeros(length(map)+1, 1); 	%The map stored as a polygon for the insidepoly function
scanOffset = zeros(1, 2);		     	%stores the offset of center of rotation of the simulated ultrasound
scanConfig = zeros(nscans, 2);		     	%stores how the robot performs a scan (number of points, angle between points)


%---------------------------------------------------
% Each bot is allocated the following variables.
%---------------------------------------------------
pos = zeros(nparticles, 2);    %position of the robot
ang = zeros(nparticles);       %angle of the robot (radians)
dir = zeros(nparticles, 2);    %angle of the robot (stored as 2D unit vector)

sensorNoise = 0;						     %Error standard deviation in cm
motionNoise = 0;							     %cm error stdDev per unit length in cm/cm
turningNoise = 0;    						     %Radian stdDev error per radian rad/rad
weight = zeros(nparticles);
scan_dist = zeros(nscans, nparticles);
shift_dist = zeros(nscans, nparticles);
%  cp;						% Crossing point

%---------------------------------------------------
% Robot variables
%---------------------------------------------------
r_scanOffset = zeros(1, 2);
r_sensorNoise = 0;
r_motionNoise = 0;
r_turningNoise = 0;
r_scan_dist = zeros(nscans, 1);
r_shift_dist = zeros(nscans, 1);

%---------------------------------------------------
% #defines
%---------------------------------------------------
DRAW_ROBOT = 1;
DRAW_PARTICLE = 0;
