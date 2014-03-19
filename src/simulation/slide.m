% I NEED THE BOTANG

%  test 1
%  ---
%  old = [40, 40];
%  r_pos = old;
%  
%  delta_angle = degtorad(50);
%  movedist = 50;
%
% test 2
% -------
%  old = [50, 70];
%  r_pos = old;
%  
%  delta_angle = degtorad(270);
%  movedist = 50;

clc;
clear all;
close all;
declareGlobals;

old = [60, 80];
r_pos = old;

delta_angle = degtorad(250);
movedist = 70;

r_ang = 0;
r_dir = [0, 0];
[r_ang r_dir] = turn(r_ang, delta_angle, r_dir, r_turningNoise);
[r_pos r_ang r_dir] = move(r_pos, r_ang, r_dir, movedist, r_motionNoise, r_turningNoise);

new = r_pos;

lines = [[old(1) old(2)];  [new(1) new(2)]];
line(lines(:,1), lines(:,2), 'lineWidth', 2, 'Color', 'b');

hold on;
dist_on = cartDist(old(1), old(2), new(1), new(2));
dist = dist_on;
dist

botpos_mat = repmat(old, length(map_lines), 1); 		% (repeat matrix) preallocate for speed

while(dist) 
  lineseg = [old, new];

  % Find the intersection point and the particular map line being intersected.
  cps = intersection(lineseg, map_lines);
  distSQ = sum((cps - botpos_mat).^2, 2);
  [distances(i,:) index] = min(distSQ);
  cross_pt = cps(index, :);
  cross_pt
  % Store the distance between cp and the new point that is outside the map.
  
  % Find the map point the lineseg is tending towards.
  pt_right = map_lines(index, 3:4);
  pt_left = map_lines(index, 1:2);

  % Find if the map line is along the x or y direction.
  if(pt_right(1) == pt_left(1))
    dist = abs(cross_pt(2) - new(2));
    'x here'
  else
    dist = abs(cross_pt(1) - new(1));
    'y here'
  end
    dist
    
    
    
%    dist_cn = cartDist(cross_pt(1), cross_pt(2), new(1), new(2));
%    dist = dist_cn;
%  
  if(r_ang > pi)
    v1 = [pt_right - pt_left];
  else
    v1 = [pt_left - pt_right];
  end
  v2 = [cross_pt - new];
   
  tend_dir = dot(v1,v2);
  
  if(r_ang <= pi)
    if(tend_dir > 0)
      tend_pt = pt_right;
    else
      tend_pt = pt_left;
    end
  else
    if(tend_dir > 0)
      tend_pt = pt_left;
    else
      tend_pt = pt_right;
    end
  end
  tend_pt

  %---
  % Crossing point = cross_pt
  % Particular map point = tend_pt
  % Find if the extra distance to be moved can be covered on the intersecting map line.
  %---
  dist_tend = cartDist(cross_pt(1), cross_pt(2), tend_pt(1), tend_pt(2));
  
  option = -1;
  if(cross_pt(1) == tend_pt(1))
    option = 2;
  elseif(cross_pt(2) == tend_pt(2))
    option = 1;
  end
 
  if(r_ang > pi)
    if(tend_dir > 0)
      cross_pt(option) = cross_pt(option) - dist;
    elseif(tend_dir < 0)
      cross_pt(option) = cross_pt(option) + dist;
    end
  elseif(r_ang <= pi)
    if(tend_dir >= 0)
      cross_pt(option) = cross_pt(option) + dist;
    elseif(tend_dir < 0)
      cross_pt(option) = cross_pt(option) - dist;
    end
  end
 
 cross_pt
 %---
 % Check if the resulting point is still within the map
 % Crossing point == cross_pt, has been shifted along the map line at this point.
 %---

  inside = inpolygon(cross_pt(1), cross_pt(2), inpolygonMapformatX, inpolygonMapformatY);

  % If the resultant point goes outside, set it to the corner point.
  if(~inside) 
    move_pt = tend_pt;
    break;
  end

  % Check if the resultant point goes beyond the particular map line we had intersected.
  beyond = 0;
  if(r_ang > pi)
    if(tend_dir >= 0)
      if(cross_pt(option) - tend_pt(option) < 0)
	beyond = 1;
      end
    elseif(tend_dir < 0)
      if(cross_pt(option) - tend_pt(option) > 0)
	beyond = 1;
      end
    end
  elseif(r_ang <= pi)
    if(tend_dir >= 0)
      if(cross_pt(option) - tend_pt(option) > 0)
	beyond = 1;
      end
    elseif(tend_dir < 0)
      if(cross_pt(option) - tend_pt(option) < 0)
	beyond = 1;
      end
    end
  end


  if(~beyond)
    move_pt = cross_pt;
    break;
  end

  % The program flow will come here only if the resultant point is beyond and still within the map
  'in and beyond'
  dist = cartDist(cross_pt(1), cross_pt(2), tend_pt(1), tend_pt(2));
  old = tend_pt;

  botdir = [cos(r_ang) sin(r_ang)];
  new = tend_pt + botdir * (dist + (dist * randn(1) * motionNoise));
  
  dist
  inside = inpolygon(new(1), new(2), inpolygonMapformatX, inpolygonMapformatY);
  
  move_pt = new;
  
  if(inside)
    break;
  end
  
end

plot(move_pt(1), move_pt(2), 'y.','MarkerSize',20);