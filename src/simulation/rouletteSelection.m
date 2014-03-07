%---------------------------------------------------
% ROULETTE-WHEEL SELECTION
% Cumulative Sum
%---------------------------------------------------
function rouletteSelection(particle, nparticles)

  running_sum = 0;
  c_sum = zeros(nparticles);

  for j = 1:nparticles
    running_sum += particle(j).weight;
    c_sum(j) = running_sum;
  end

  sel_index = 0;
  for j = 1:nparticles
    sel_index = rand();
    
    for i = 1:nparticles
      if sel_index < c_sum(i)
	sel_index = i;
	break;
      end
    end
    
    tmp_particle(j) = particle(sel_index);
  end
  
  particle = tmp_particle;

end