%
% Parameters that should be allocated before the script is called.
% delta_angle, botang, botpos, movedist
% Return values
% delta_angle
%
% For checkPoint
% --------------
% Parameters that should be allocated before the script is called.
% delta_angle, botang, botpos, movedist
% Return values
% inside
%
% localScan  - returns the crossing points in 8 directions.
% -----------
% needs - delta_angle, r_ang, r_pos, ndirs
% returns r_scan_dist & r_cross_pts - they will contain 'ndirs' dimensions.
%

inside = OUT_MAP;

turn_angle = 0.7854;		% 45 deg
alt_turn_angle = 0.3491;	% 20 deg

min_ang = 0.0873;
max_ang = 0.2618;		% 15 deg

delta_angle = (rand()*max_ang) + min_ang;
ndirs = 8;

min_dist = 5;
max_dist = 15;

while(1)
  localScan;
  delta_dist = (rand()*max_dist) + min_dist;
  del_ind = 0;
  r_scan_dist = r_scan_dist - 10;
  pickPriorityAng;
  
  if(del_ind ~= 0)
    break;
  end
  
  delta_angle = delta_angle + alt_turn_angle;
  
end

movedist = delta_dist;
delta_angle = ((del_ind - 1) * turn_angle) + delta_angle; 		% times 45deg
