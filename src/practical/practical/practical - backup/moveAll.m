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
manoeuvre = false;
manoeuvre_dir = false;

robotRepos;				% We get the new delta_angle from here.
del_ind

mlist(1, :) = [delta_angle movedist];
manoeuvre
%   [r_ang r_dir] = turn(r_ang, delta_angle, r_dir, r_turningNoise);
if(manoeuvre == true && (del_ind == 3 || del_ind == 7))
    manoeuvre_r(leftMot, rightMot, 90, manoeuvre_dir);
    manoeuvre = false;
else
    turnOnSpotAng = round(radtodeg((del_ind - 1) * turn_angle));
    if(turnOnSpotAng > 1 && turnOnSpotAng < 359)
        if (turnOnSpotAng > 180)
            turnOnSpotAng = 360 - turnOnSpotAng;
            
%             if (turnOnSpotAng > 45)
%                 turnOnSpotAngDiv = turnOnSpotAng / 45;
%                 turnOnSpotCounter = 1;
%                 while(turnOnSpotCounter < turnOnSpotAngDiv)
%                     turnOnSpot_r(leftMot, rightMot, 45, 20, true, r_scan_dist, nscans);
%                     turnOnSpotCounter = turnOnSpotCounter + 1;
%                 end
%                 
%             end
            turnOnSpot_r(leftMot, rightMot, turnOnSpotAng, 30, true, r_scan_dist, nscans);
        else
%             if (turnOnSpotAng > 45)
%                 turnOnSpotAngDiv = turnOnSpotAng / 45;
%                 turnOnSpotCounter = 1;
%                 while(turnOnSpotCounter < turnOnSpotAngDiv)
%                     turnOnSpot_r(leftMot, rightMot, 45, 20, false, r_scan_dist, nscans);
%                     turnOnSpotCounter = turnOnSpotCounter + 1;
%                 end
%                 
%             end
            turnOnSpot_r(leftMot, rightMot, turnOnSpotAng, 30, false, r_scan_dist, nscans);
        end
    end
end
%   [spos_new sang sdir] = move(r_pos, r_ang, r_dir, movedist, motionNoise, turningNoise);
if(movedist ~= 0)
    move_r(leftMot, rightMot, movedist, 40, false);
end

%     spos = r_pos;
% delta_angle, botang, botpos, movedist
%     inside = checkPoint(delta_angle, sang, spos_new, movedist, pad_map_lines, pad_inpolygonMapformatX, pad_inpolygonMapformatY);

%     sdist = movedist;
% sang, spos, spos_new, sdir, sdist
%     if(~inside)
%         slide;
%         r_pos = move_pt;
%     else
%         r_pos = spos_new;
%     end

option = DRAW_PARTICLE;
for ind = 1:nparticles
    
    botang = ang(ind);
    botpos(1, :) = pos(ind, :);
    delta_angle = mlist(1, 1);
    movdist = mlist(1, 2);
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
        %slide;
        
        %pos(ind, :) = move_pt;
        
    end
end



