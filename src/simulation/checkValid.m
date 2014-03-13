%---------------------------------------------------
% CHECK FOR CONVERGENCE
%---------------------------------------------------
function result = checkValid(robot, corner, ilist)

  result = 0;
  nrows = size(ilist);
  quickSortD(ilist, 1, nrows(1));
  
  if(robot.pos(1) == ilist(1,1) && robot.pos == ilist(1,2))
    result = 1;
  end
  
end