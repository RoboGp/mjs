function moveAll(robot, particle, nparticles)

  INSIDE_MAP = 1;
  [angle distance] = robotRepos(robot);
  
  [angle distance]

  robot.turn(angle);
  robot.move(distance);
  
%    for i = 1:nparticles
%      if (checkPoint(particle(i), angle, distance) == INSIDE_MAP)
%        particle(i).move(distance);
%        particle(i).turn(angle);
%      end
%    end

end