function result = checkPoint(bot, angle, distance)

%    angle = 90;
  
  angle = angle + bot.getBotAng();
  dir = [cos(angle) sin(angle)];
  
  old_pos = bot.getBotPos();
%    size(old_pos)
  new_pos = old_pos + (dir * distance);
  
  result = inpolygon(new_pos(1), new_pos(2), bot.inpolygonMapformatX, bot.inpolygonMapformatY);
%    plot(new_pos(1), new_pos(2), 'r.','MarkerSize',20);
  
  if (result == 1)

    botpos = repmat(old_pos,length(bot.mapLines),1); %preallocate for speed
    line_seg = [old_pos new_pos];
    cps(:,:) = intersection(line_seg, bot.mapLines);
    distSQ =sum((cps(:,:) - botpos).^2,2);
    [distances(1,:) index] = min(distSQ);
    
    if(cartDist(old_pos(1), old_pos(2), cps(index, 1), cps(index, 2)) < cartDist(old_pos(1), old_pos(2), new_pos(1), new_pos(2)))
      result = 0;
    end
  end
  
end


