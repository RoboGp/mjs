% sort_index contains the indices of all the intersecting map lines in sorted order (asc order)
% At this point, cross_pt contains the nearest intersecting point.

% If I'm on a line and trying to move inside the polygon to another line, select the second line -> option == 2
% If I'm on a corner, move away from it and loop again.


if(sort_distSQ(1) == 0 && ~isnan(sort_distSQ(2)))	% If intersecting more than one line and I'm on the nearest intersected line
  delta_angle = sang;
  botang = 0;
  botpos = bumps(sort_index(1), :);			
  movedist = 1;

  newang = delta_angle + botang;
  newdir = [cos(newang) sin(newang)];
  newpos = botpos + (newdir * movedist);
  
  % This a 1 cm check from the crossing point.
  inside = inpolygon(newpos(1), newpos(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
  
  if(inside)
    spos = newpos;
    option = -1;
  else
    if(sort_distSQ(2) == 0)				% At a corner
      spos = moveFromCorner(botpos, pad_inpolygonMapformatX, pad_inpolygonMapformatY);
      option = -1;
    else
      option = 1;
    end
  end

end

