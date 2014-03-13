%---------------------------------------------------
% NORMALIZE & SORT
%---------------------------------------------------
function quickSortP(particle, l, r)

  if (r == l) 
    return;
  end
  
  pivot = particle(l);
  i = l+1;
  
  for j = l+1:r 
    if(particle(j).weight < pivot.weight) 
      swapParticles(particle, i, j);      
      i++;
    end
  end
  
  swapParticles(particle, l, i-1);
  quickSortP(particle, l, i-1);
  quickSortP(particle, i, r);

end


