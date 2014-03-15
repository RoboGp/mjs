function moveAll(robot, particle, nparticles)

  INSIDE_MAP = 1;
  [angle distance] = robotRepos(robot);
  
  [angle distance]

  robot.turn(angle);
  robot.move(distance);
  
  for i = 1:nparticles
    if (checkPoint(particle(i), angle, distance) == INSIDE_MAP)
      particle(i).turn(angle);
      particle(i).move(distance);
    end
  end

end