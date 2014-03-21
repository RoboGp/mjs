    botang = ang(ind);
    botpos(1, :) = pos(ind, :);
    delta_angle = mlist(y, 1);
    movdist = mlist(y, 2);
    checkPoint;				% Checks if delta_angle and movedist will get a point inside the map.
    
    [ang(ind) dir(ind, :)] = turn(ang(ind), delta_angle, dir(ind, :), turningNoise);

%      ang
    if (inside == IN_MAP)
      [pos(ind, :) ang(ind) dir(ind, :)] = move(pos(ind, :), ang(ind), dir(ind, :), movedist, motionNoise, turningNoise);
%      else
%        sang = ang(ind);
%        spos = pos(ind, :);
%        [spos_new sang sdir] = move(pos(ind, :), ang(ind), dir(ind, :), movedist, motionNoise, turningNoise);
%        sdist = movedist;
%  
%        % sang, spos, spos_new, sdir, sdist
%        slide;
%        
%        pos(ind, :) = move_pt;
    end
   end
end

sdist = movdist;
sang = 
while(sdist)
  delta_angle = 
end