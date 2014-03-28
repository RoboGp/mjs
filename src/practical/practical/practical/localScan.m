% I need to get just 8 values here.
temp_config = scanConfig;
temp_nscans = nscans;

nscans = ndirs;
generateScanConfig;			% sets scanConfig

botpos = r_pos(1, :);
botang = r_ang + delta_angle;
%  botdir = 

ultraScan;

r_scan_dist = distances;
r_cross_pts = crossingPoints;

%  length(r_cross_pts)

nscans = temp_nscans;
scanConfig = temp_config;

%  delta_angle
%  [r_scan_dist r_cross_pts]