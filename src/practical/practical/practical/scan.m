%---------------------------------------------------
% 20 SCANS (360deg) with a 18deg gap.
% Get the crossing points and distances along scan lines for the robot and all particles
%---------------------------------------------------

% ultraScan;
if (rotateBack == false) 
    r_scan_dist_1 = ultraScan_r(sensorMot, SENSOR_2, scanSpeed, nscans);
    rotateBack = true;
else 
    r_scan_dist_1 = ultraScan_rBack(sensorMot, SENSOR_2, scanSpeed, nscans);
    rotateBack = false;
end

for ind = 1:nparticles
  botpos = pos(ind, :);
  botang = ang(ind);
  %ultraScan;
  ultraScanQ;
  scan_dist(:, ind) = distances;
  scan_dist(scan_dist > 100) = 100;
  scan_dist(scan_dist < 8) = 8;
  %scan_dist(12) = r_scan_dist_1(8); %%
  cross_pts(ind, :, :) = crossingPoints;
end


  



