function result = checkPoint(bot, angle, distance)

  angle = angle + bot.getBotAng();
  
  dir = [cos(angle) sin(angle)];
  
  pos = bot.getBotPos();
  
  pos = pos + (dir * distance);
  
  result = inpolygon(pos(1), pos(2), bot.inpolygonMapformatX, bot.inpolygonMapformatY);
  
  plot(pos(1), pos(2), 'r.','MarkerSize',20)
end