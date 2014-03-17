%---------------------------------------------------
% FIND THE BEST SHIFTED HISTOGRAM
% Get the histogram of particle(i) with the best overlap as 
% the robot's histogram
%---------------------------------------------------

for ind = 1:nparticles
  min_err = inf;
  angle = 0;
  for i = 1:nscans
    diff = r_scan_dist - scan_dist(:, ind);
    diff = diff.*diff;
    sq_err = sum(diff);
    
    if(sq_err < min_err) 
      angle = i;
      min_err = sq_err;
      shift_dist(:, ind) = scan_dist(:, ind);
    end
    scan_dist(:, ind) = circshift(scan_dist(:, ind), 1);
  end
      
  angle = (angle - 1) * (360/nscans);
  angle = degtorad(angle);
  ang(ind) = ang(ind) - angle;

end

