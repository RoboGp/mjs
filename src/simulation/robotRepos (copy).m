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

%  delta_angle = rand() * 360;
%  delta_angle = round(delta_angle);
%  delta_angle = degtorad(delta_angle);

min_ang = 0.0873;
max_ang = 0.2618;

delta_angle = (rand()*max_ang) + min_ang;
ndirs = 8;

min_dist = 5;
max_dist = 15;

while(1)
  localScan;
  
  delta_dist = (rand()*max_dist) + min_dist;

  del_ind = 0;

  r_scan_dist = r_scan_dist - 10;
  
  if (r_scan_dist(1) > delta_dist)
    del_ind = 1;
    break;
  end
  
  if(r_scan_dist(2) > delta_dist && r_scan_dist(8) > delta_dist)
    if(rand() > 0.5)
      del_ind = 8;
    else
      del_ind = 2;
    end
    break;
  elseif(r_scan_dist(2) > delta_dist)
    del_ind = 2;
    break;
  elseif(r_scan_dist(8) > delta_dist)
    del_ind = 8;
    break;
  end
  
  if(r_scan_dist(3) > delta_dist && r_scan_dist(7) > delta_dist)
    if(rand() > 0.5)
      del_ind = 7;
    else
      del_ind = 3;
    end
    break;
  elseif(r_scan_dist(3) > delta_dist)
    del_ind = 3;
    break;
  elseif(r_scan_dist(7) > delta_dist)
    del_ind = 7;
    break;
  end
  
  
  if(r_scan_dist(4) > delta_dist && r_scan_dist(6) > delta_dist)
    if(rand() > 0.5)
      del_ind = 6;
    else
      del_ind = 4;
    end
    break;
  elseif(r_scan_dist(4) > delta_dist)
    del_ind = 4;
    break;
  elseif(r_scan_dist(6) > delta_dist)
    del_ind = 6;
    break;
  end
  
  
 if(r_scan_dist(5) > delta_dist)
    del_ind = 5;
    break;
  end

  if(del_ind ~= 0)
    break;
  end
  
  'came here'
  delta_angle = delta_angle + alt_turn_angle;
  
end

movedist = delta_dist;
delta_angle = (del_ind * turn_angle) -turn_angle + delta_angle; 		% times 45deg

%  
%  
%  turn_count = 1;
%  
%  while(turn_count <= 8)
%    
%    checkPoint;
%    if(inside == IN_MAP)
%      break;
%    end
%  
%    delta_angle = delta_angle + turn_angle;    
%  
%  end
%  
%  while(~inside)
%    delta_angle = delta_angle + alt_turn_angle;
%    checkPoint;
%  end





