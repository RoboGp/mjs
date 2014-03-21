% For robotRepos
% ---------------
% Parameters that should be allocated before the script is called.
% r_ang, r_pos
% Return values
% delta_angle, movedist
%
% For checkPoint
% --------------
% Parameters that should be allocated before the script is called.
% delta_angle, botang, botpos, movedist
% Return values
% inside
%

%  botpos = zeros(1, 2);
%  botang = r_ang;
%  botpos(1, :) = r_pos(1, :);
%  
option = DRAW_ROBOT;

nmotions = 1;

mlist = zeros(nmotions, 2);

for y = 1:nmotions
  robotRepos;				% We get the new delta_angle from here.
  mlist(y, :) = [delta_angle movedist];
  
  [r_ang r_dir] = turn(r_ang, delta_angle, r_dir, r_turningNoise);
  
  [spos_new sang sdir] = move(r_pos, r_ang, r_dir, movedist, motionNoise, turningNoise);

  spos = r_pos;
  % delta_angle, botang, botpos, movedist
  inside = checkPoint(delta_angle, sang, spos_new, movedist, pad_map_lines, pad_inpolygonMapformatX, pad_inpolygonMapformatY);

  sdist = movedist;
  % sang, spos, spos_new, sdir, sdist
  if(~inside)
    slide;
    r_pos = move_pt;
  else
    r_pos = spos_new;
  end
end

option = DRAW_PARTICLE;
for ind = 1:nparticles
  for y = 1:nmotions
    botang = ang(ind);
    botpos(1, :) = pos(ind, :);
    delta_angle = mlist(y, 1);
    movdist = mlist(y, 2);
    inside = checkPoint(delta_angle, botang, botpos, movdist, pad_map_lines, pad_inpolygonMapformatX, pad_inpolygonMapformatY);			    
    [ang(ind) dir(ind, :)] = turn(ang(ind), delta_angle, dir(ind, :), turningNoise);

    if (inside == IN_MAP)
      [pos(ind, :) ang(ind) dir(ind, :)] = move(pos(ind, :), ang(ind), dir(ind, :), movedist, motionNoise, turningNoise);
    else
      sang = ang(ind);
      spos = pos(ind, :);
      [spos_new sang sdir] = move(pos(ind, :), ang(ind), dir(ind, :), movedist, motionNoise, turningNoise);
      sdist = movedist;

      % sang, spos, spos_new, sdir, sdist
      slide;
      
      pos(ind, :) = move_pt;
    end
   end
end



