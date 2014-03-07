%---------------------------------------------------
% 20 SCANS (360deg) with a 18deg gap.
%---------------------------------------------------
function scan(robot, particle, nparticles)

  [robot.distance robot.crossingPoint]  = robot.ultraScan();

  for i = 1:nparticles
    [particle(i).distance particle(i).cp]  = particle(i).ultraScan();
  end

end