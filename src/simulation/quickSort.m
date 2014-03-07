%---------------------------------------------------
% NORMALIZE & SORT
%---------------------------------------------------
function quickSort(particle, l, r)

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
  quickSort(particle, l, i-1);
  quickSort(particle, i, r);

end


