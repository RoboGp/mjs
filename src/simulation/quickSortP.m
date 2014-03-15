%---------------------------------------------------
% NORMALIZE & SORT
%---------------------------------------------------
function particle = quickSortP(particle, nparticles)

  w = zeros(nparticles, 1);
  for i = 1:nparticles
    w(i) = particle(i).weight;
  end

  [sort_w ind] = sort(w);

  particle = particle(ind);

end


