%---------------------------------------------------
% INITIALISATION
%---------------------------------------------------
% Initialise robot
function [robot particle] = init(x, y, theta, nscans, nparticles)

  robot = BotSim(map);
  robot.setBotPos([x y]);
  robot.setBotAng(theta);
  robot.weight = 0;
  robot.distance = zeros(nscans, 1);
  robot.o_distance = zeros(nscans, 1); 
  robot.setScanConfig(robot.generateScanConfig(nscans));  %sets the scan configuration on the botSim.  

  robot.drawMap();
  robot.drawBot(3);

  % Initialise nparticles
  for i = 1:nparticles
      particle(i).weight = 0;
      particle(i).distance = zeros(nscans, 1);
      particle(i).o_distance = zeros(nscans, 1);
      particle(i) = BotSim(map);
      particle(i).randomPose(5); %at least 5cm from the wall
      particle(i).drawBot(3);
      particle(i).setScanConfig(particle(i).generateScanConfig(nscans));
  end

end