%---------------------------------------------------
% NORMALIZE & SORT
%---------------------------------------------------
function quickSortD(ilist, l, r)

  if (r == l) 
    return;
  end
  
  pivot = ilist(l);
  i = l+1;
  
  for j = l+1:r 
    if(ilist(j, 3) < pivot(1,3) 
      swapPoints(ilist, i, j);      
      i++;
    end
  end
  
  swapPoints(ilist, l, i-1);
  quickSortD(ilist, l, i-1);
  quickSortD(ilist, i, r);

end

function particle = quickSortP(ilist, num)

  w = zeros(num, 1);
  for i = 1:num
    w(i) = ilist(i)
  end

  [sort_w ind] = sort(w);
  particle = particle(ind);

end

