%---------------------------------------------------
% FIND THE BEST SHIFTED HISTOGRAM
% Get the histogram of particle(i) with the best overlap as 
% the robot's histogram
%---------------------------------------------------
function correctShift(robot, particle, nscans, nparticles)

  for j = 1:nparticles
    min_err = inf;
    for i = 1:nscans
      diff = robot.distance - particle(j).distance;
      diff = diff.*diff;
      sq_err = sum(diff);
      
      if(sq_err < min_err) 
	min_err = sq_err;
	particle(j).o_distance = particle(j).distance;
      end

      particle(j).distance = circshift(particle(j).distance, 1);
    end
  end
  
end