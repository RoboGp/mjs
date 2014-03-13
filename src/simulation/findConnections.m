%---------------------------------------------------
% FIND THE BEST SHIFTED HISTOGRAM
%---------------------------------------------------
function ilist = findConnections(robot, c)
  
  i = 1;
  for w = 1 : nrows(1)
    
    if(w == nrows(1)
      cp = intersection(robot.pos, robot.map(c,:), robot.map(w,:), robot.map(1,:));
    else
      cp = intersection(robot.pos, robot.map(c,:), robot.map(w,:), robot.map(w+1,:));
    end

    if(cp(1) ~= NAN && cp(2) ~= NAN)
      ilist(i) =  robot.map(w,:);
      ilist(i,3) = distance(robot.pos, robot.map(w,:));
    end
    
  end
  
end