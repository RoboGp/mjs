% For robotRepos
% ---------------
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


movedist = 10;
delta_angle = 0;

botpos = zeros(1, 2);
botang = r_ang;
botpos(1, :) = r_pos(1, :);

robotRepos;				% We get the new delta_angle from here.
  
[r_ang r_dir] = turn(r_ang, delta_angle, r_dir, r_turningNoise);
[r_pos r_ang r_dir] = move(r_pos, r_ang, r_dir, movedist, r_motionNoise, r_turningNoise);


for ind = 1:nparticles
  botang = ang(ind);
  botpos(1, :) = pos(ind, :);

  checkPoint;				% Checks if delta_angle and movedist will get a point inside the map.
  if (inside == IN_MAP)
   
    [ang(ind) dir(ind, :)] = turn(ang(ind), delta_angle, dir(ind, :), turningNoise);
    [pos(ind, :) ang(ind) dir(ind, :)] = move(pos(ind, :), ang(ind), dir(ind, :), movedist, motionNoise, turningNoise);
    
%      option = DRAW_PARTICLE;
%      drawBot;

  end
end



