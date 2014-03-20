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
%  option = DRAW_ROBOT;

nmotions = 1;

mlist = zeros(nmotions, 2);

for y = 1:nmotions
  robotRepos;				% We get the new delta_angle from here.
  mlist(y, :) = [delta_angle movedist];
  [r_ang r_dir] = turn(r_ang, delta_angle, r_dir, r_turningNoise);
  [r_pos r_ang r_dir] = move(r_pos, r_ang, r_dir, movedist, r_motionNoise, r_turningNoise);
end

option = DRAW_PARTICLE;
for ind = 1:nparticles
  for y = 1:nmotions
    botang = ang(ind);
    botpos(1, :) = pos(ind, :);
    delta_angle = mlist(y, 1);
    movdist = mlist(y, 2);
    checkPoint;				% Checks if delta_angle and movedist will get a point inside the map.
    
    [ang(ind) dir(ind, :)] = turn(ang(ind), delta_angle, dir(ind, :), turningNoise);

    if (inside == IN_MAP)
      [pos(ind, :) ang(ind) dir(ind, :)] = move(pos(ind, :), ang(ind), dir(ind, :), movedist, motionNoise, turningNoise);
    else
      sang = ang(ind);
      spos = pos(ind, :);
      [spos_new sang sdir] = move(pos(ind, :), ang(ind), dir(ind, :), movedist, motionNoise, turningNoise);
      sdist = movedist;

      slide;
      
      pos(ind, :) = move_pt;
    end
   end
end



