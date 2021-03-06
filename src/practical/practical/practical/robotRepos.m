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

max_ang = 0.0373;
min_ang = 0.0175;		% 15 deg

delta_angle = (rand() * max_ang) + min_ang;
ndirs = 8;

max_dist = 10;
min_dist = 5;

while(1)
    %   localScan;
    [r_scan_dist, manoeuvre, manoeuvre_dir] = localScan_r(r_scan_dist_1);
    
    r_scan_dist = r_scan_dist - 20;
    delta_dist = (rand()*min_dist) + max_dist;
    delta_dist = abs(min(delta_dist, (max(r_scan_dist([1 3 5 8 10 12 14 17])) - max_dist*2))) + 1;
    del_ind = 0;
    while(del_ind == 0)
        delta_dist = delta_dist - 1;
        pickPriorityAng;
    end
    if(del_ind == 3)
        
    elseif(del_ind == 7)
    end
    
    if(del_ind ~= 0)
        break;
    end
    
    delta_angle = delta_angle + alt_turn_angle;
    
end

movedist = delta_dist;
delta_angle = ((del_ind - 1) * turn_angle) + delta_angle; 		% times 45deg
delta_angle = mod(delta_angle, pi * 2);
