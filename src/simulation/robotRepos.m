function [angle distance] = robotRepos(robot)

  INSIDE_MAP = 1;
  
  distance = 30;
  turn_angle =  0.0873;
  
  angle = rand() * 360;
  angle = round(angle);
  angle = degtorad(angle);
  
  while (checkPoint(robot, angle, distance) ~= INSIDE_MAP)
    angle = angle + turn_angle;    
  end
  
end

