close all;
drawMap;
hold on;

spos = [40, 60];
sang = degtorad(225);
sdist = 100;
sang = mod(sang, 2*pi);
sdir = [cos(sang) sin(sang)];

[spos_new sang sdir] = move(spos, sang, sdir, sdist, 0, 0);

lines = [[spos(1) spos(2)];  [spos_new(1) spos_new(2)]];
line(lines(:,1), lines(:,2), 'lineWidth', 2, 'Color', 'b');

botpos_mat = repmat(spos, length(pad_map_lines), 1); 		% (repeat matrix) preallocate for speed

while(sdist) 
  lineseg = [spos, spos_new];

  % Find the intersection point and the particular map line being intersected.
  cps = intersection(lineseg, pad_map_lines);
  distSQ = sum((cps - botpos_mat).^2, 2);

  [sort_distSQ sort_index] = sort(distSQ);
  [distances(i,:) index] = min(sort_distSQ);
  index = sort_index(1);
  cross_pt = cps(index, :);

  % Store the distance between cp and the new point that is outside the map.
  
  % Find the map point the lineseg is tending towards.
  % Find if the map line is along the x or y direction.
%    if(sort_distSQ(1) == 0 && ~isnan(sort_distSQ(2)))	% If intersecting more than one line and I'm on the nearest intersected line
%      check_dist = 1;
%      check_pos = cross_pt + (sdir * check_dist);
%      
%      option = 2;
%      if(sort_distSQ(2) == 0)
%        option = 3;
%      end
%      
%      if(inpolygon(check_pos(1), check_pos(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY))
%        pt_a = pad_map_lines(sort_index(option), 3:4);
%        pt_b = pad_map_lines(sort_index(option), 1:2);
%        cross_pt = cps(sort_index(option), :);
%      end
%    else
    pt_a = pad_map_lines(index, 3:4);
    pt_b = pad_map_lines(index, 1:2);
%    end

  if(pt_a(2) == pt_b(2))
    sdist = abs(cross_pt(1) - new(1));
    if(pt_a(1) < pt_b(1))
      pt_left = pt_a;
      pt_right = pt_b;
    else
      pt_left = pt_b;
      pt_right = pt_a;
    end
  elseif(pt_a(1) == pt_b(1))
    sdist = abs(cross_pt(2) - new(2));
    if(pt_a(2) < pt_b(2))
      pt_left = pt_a;
      pt_right = pt_b;
    else
      pt_left = pt_b;
      pt_right = pt_a;
    end
  end
  
  v1 = [pt_left - pt_right];
  v2 = [cross_pt - new];
   
  tend_dir = dot(v1,v2);
%    tend_dir
  if(tend_dir > 0)
    tend_pt = pt_right;
  else
    tend_pt = pt_left;
  end

  %---
  % Crossing point = cross_pt
  % Particular map point = tend_pt
  % Find if the extra distance to be moved can be covered on the intersecting map line.
  %---
  cross_pt = abs(cross_pt);

  cross_pt = (round(cross_pt .* 1000))/1000;
  if(cross_pt(2) == tend_pt(2) && cross_pt(1) ~= tend_pt(1))			% Moving along y axis
    cross_pt(1) = cross_pt(1) + sign(tend_dir) * sdist;
    cross_pt = (round(cross_pt .* 1000))/1000;
    inside = inpolygon(cross_pt(1), cross_pt(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
    if(~inside) 
      move_pt = tend_pt(1) - sign(tend_dir);
      break;
    end
  elseif(cross_pt(1) == tend_pt(1) && cross_pt(2) ~= tend_pt(2))						% Moving along x axis
    cross_pt(2) = cross_pt(2) + sign(tend_dir) * sdist;
    cross_pt = (round(cross_pt .* 1000))/1000;
    inside = inpolygon(cross_pt(1), cross_pt(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
    if(~inside) 
      move_pt = tend_pt(2) - sign(tend_dir);
      break;
    end
  end
  
  
    
 plot(cross_pt(1), cross_pt(2), 'g.','MarkerSize',5);
%   
%   %---
%   % Check if the resulting point is still within the map
%   % Crossing point == cross_pt, has been shifted along the map line at this point.
%   %---
%  
  
  % If the resultant point goes outside, set it to the corner point.
  inside
  

  tend_dir
  % Check if the resultant point goes beyond the particular map line we had intersected.
  beyond = 0;
  if(tend_pt(2) == cross_pt(2))		% Moving along the y axis
    if(tend_dir > 0)			% Moving to the right
      if(tend_pt(1) - cross_pt(1) < 0)  % cross_pt has gone too much to the right.
	beyond = 1;
      end
    else				% Moving to the left 
      if(cross_pt(1) - tend_pt(1) < 0)  % cross_pt has gone too much to the left.
	beyond = 1;
      end
    end
  else					% Moving along the x axis
    if(tend_dir > 0)			% Moving up
      if(tend_pt(2) - cross_pt(2) < 0)  % cross_pt has gone too much to the top.
	beyond = 1;
      end
    else				% Moving down
      if(cross_pt(1) - tend_pt(1) < 0)  % cross_pt has gone too much to the botttom.
	beyond = 1;
      end
    end
  end
  
  if(~beyond)
    move_pt = cross_pt;
    break;
  end

  % The program flow will come here only if the resultant point is beyond and still within the map
  sdist = cartDist(cross_pt(1), cross_pt(2), tend_pt(1), tend_pt(2));
  old = tend_pt;

%    sdir = [cos(sang) sin(sang)];
  new = tend_pt + sdir * (sdist + (sdist * randn(1) * motionNoise));
  
  inside = inpolygon(new(1), new(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
  
  move_pt = new;
  
  if(inside)
    break;
  end
  
end

plot(move_pt(1), move_pt(2), 'y.','MarkerSize',20);


