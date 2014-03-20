old = spos;
new = spos_new;

sdist_old = sdist;
spos_old = spos;
spos_new_old = spos_new;

lines = [[old(1) old(2)];  [new(1) new(2)]];

botpos_mat = repmat(old, length(pad_map_lines), 1); 		% (repeat matrix) preallocate for speed

while(sdist) 
  lineseg = [old, new];

  % Find the intersection point and the particular map line being intersected.
  cps = intersection(lineseg, pad_map_lines);
  distSQ = sum((cps - botpos_mat).^2, 2);
  [distances(i,:) index] = min(distSQ);
  cross_pt = cps(index, :);

  % Store the distance between cp and the new point that is outside the map.
  
  % Find the map point, the lineseg is tending towards.
  pt_right = pad_map_lines(index, 3:4);
  pt_left = pad_map_lines(index, 1:2);

  % Find if the map line is along the x or y direction.
  if(pt_right(1) == pt_left(1))
    sdist = abs(cross_pt(2) - new(2));
  else
    sdist = abs(cross_pt(1) - new(1));
  end
    
  if(isnan(sdist))
    cross_pt
    pt_right
    pt_left
    while(1)
    end
  end
%    dist_cn = cartDist(cross_pt(1), cross_pt(2), new(1), new(2));
%    sdist = dist_cn;
%  
  if(sang > pi)
    v1 = [pt_right - pt_left];
  else
    v1 = [pt_left - pt_right];
  end
  v2 = [cross_pt - new];
   
  tend_dir = dot(v1,v2);
  
  if(sang <= pi)
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

  %---
  % Crossing point = cross_pt
  % Particular map point = tend_pt
  % Find if the extra distance to be moved can be covered on the intersecting map line.
  %---
  dist_tend = cartDist(cross_pt(1), cross_pt(2), tend_pt(1), tend_pt(2));
  
  cross_pt = abs(cross_pt);
%    [cross_pt(1) == tend_pt(1) cross_pt(2) == tend_pt(2)]
%    
  if(cross_pt(1) == -0 || cross_pt(1) == 0.0000)
    cross_pt(1) = 0;
  end
  if(cross_pt(2) == -0 || cross_pt(2) == 0.0000)
    cross_pt(2) = 0;
  end

  if(round(cross_pt(1)) == tend_pt(1))
    cross_pt(1) = round(cross_pt(1));
  end
  if(round(cross_pt(2)) == tend_pt(2))
    cross_pt(2) = round(cross_pt(2));
  end
  
  option = -1;
  if(cross_pt(1) == tend_pt(1))
    option = 2;
  elseif(cross_pt(2) == tend_pt(2))
    option = 1;
  end

  if(isnan(cross_pt(1)) || isnan(cross_pt(2)))
    [cross_pt tend_pt]
    spos
    spos_new
    [sang sdist]
    while(1)
    end
  end
  
  if(sang > pi)
    if(tend_dir > 0)
      cross_pt(option) = cross_pt(option) - sdist;
    elseif(tend_dir < 0)
      cross_pt(option) = cross_pt(option) + sdist;
    end
  elseif(sang <= pi)
    if(tend_dir >= 0)
      cross_pt(option) = cross_pt(option) + sdist;
    elseif(tend_dir < 0)
      cross_pt(option) = cross_pt(option) - sdist;
    end
  end
 
 %---
 % Check if the resulting point is still within the map
 % Crossing point == cross_pt, has been shifted along the map line at this point.
 %---

  inside = inpolygon(cross_pt(1), cross_pt(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);

  % If the resultant point goes outside, set it to the corner point.
  if(~inside) 
    move_pt = tend_pt;
    break;
  end

  % Check if the resultant point goes beyond the particular map line we had intersected.
  beyond = 0;
  if(sang > pi)
    if(tend_dir >= 0)
      if(cross_pt(option) - tend_pt(option) < 0)
	beyond = 1;
      end
    elseif(tend_dir < 0)
      if(cross_pt(option) - tend_pt(option) > 0)
	beyond = 1;
      end
    end
  elseif(sang <= pi)
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