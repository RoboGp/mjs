%
% Parameters that should be allocated before the script is called.
% delta_angle, botang, botpos, movedist
% Return values
% inside
%
% Checks if the new position is within the padded map.
% If yes, checks if there is any wall (of the original map) between the robot and the new position.
%

newang = delta_angle + botang;
newdir = [cos(newang) sin(newang)];
newpos = botpos + (newdir * movedist);

inside = inpolygon(newpos(1), newpos(2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
%  plot(newpos(1), newpos(2), 'r.','MarkerSize',20);


if (inside == IN_MAP && option == DRAW_ROBOT)
  botpos_mat = repmat(botpos, length(map_lines), 1); %preallocate for speed
  line_seg = [botpos newpos];
  cps = intersection(line_seg, map_lines);
  distSQ =sum((cps(:,:) - botpos_mat).^2,2);
  [distances(1,:) index] = min(distSQ);
  
  if(cartDist(botpos(1), botpos(2), cps(index, 1), cps(index, 2)) < cartDist(botpos(1), botpos(2), newpos(1), newpos(2)))
    inside = OUT_MAP;
  end
end
