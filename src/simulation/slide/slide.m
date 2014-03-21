sang = mod(sang, 2*pi);
sdir = [cos(sang) sin(sang)];

old = spos;
new = spos_new;

botpos_mat = repmat(old, length(pad_map_lines), 1); 		% (repeat matrix) preallocate for speed

while(sdist) 
  lineseg = [old, new];

  % Find the intersection point and the particular map line being intersected.
  cps = intersection(lineseg, pad_map_lines);
  distSQ = sum((cps - botpos_mat).^2, 2);
%    distSQ(distSQ == 0) = NaN;
  [distances(i,:) index] = min(distSQ);
  cross_pt = cps(index, :);

  % Store the distance between cp and the new point that is outside the map.
  
  % Find the map point the lineseg is tending towards.
  % Find if the map line is along the x or y direction.
  option = 1;
  if(length(index) > 1)
    option = 2;
  end
  pt_a = pad_map_lines(index(option), 3:4);
  pt_b = pad_map_lines(index(option), 1:2);
  
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
  dist_tend = cartDist(cross_pt(1), cross_pt(2), tend_pt(1), tend_pt(2));
  
  cross_pt = abs(cross_pt);

  if(cross_pt(2) == tend_pt(2))			% Moving along y axis
    if(tend_dir > 0)				% Moving to the right
      cross_pt(1) = cross_pt(1) + sdist;
    else
      cross_pt(1) = cross_pt(1) - sdist;
    end
  else						% Moving along x axis
    if(tend_dir > 0)				% Moving upwards
      cross_pt(2) = cross_pt(2) + sdist;
    else					% Moving downwards
      cross_pt(2) = cross_pt(2) - sdist;
    end
  end
  
  cross_pt = (round(cross_pt .* 1000))/1000;
  
%   plot(cross_pt(1), cross_pt(2), 'g.','MarkerSize',5);
%   
%   %---
%   % Check if the resulting point is still within the map
%   % Crossing point == cross_pt, has been shifted along the map line at this point.
%   %---
%  
  inside = inpolygon(cross_pt(1), cross_pt(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
  % If the resultant point goes outside, set it to the corner point.
  if(~inside) 
    move_pt = tend_pt;
    break;
  end

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

  sdir = [cos(sang) sin(sang)];
  new = tend_pt + sdir * (sdist + (sdist * randn(1) * motionNoise));
  
  inside = inpolygon(new(1), new(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
  
  move_pt = new;
  
  if(inside)
    break;
  end
  
end

%  plot(move_pt(1), move_pt(2), 'y.','MarkerSize',20);