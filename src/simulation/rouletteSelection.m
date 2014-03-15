%---------------------------------------------------
% ROULETTE-WHEEL SELECTION
% Cumulative Sum
%---------------------------------------------------
function tmp_particle = rouletteSelection(particle, nparticles, nscans, map)

  running_sum = 0;
  c_sum = zeros(nparticles, 1);
  
  for j = 1:nparticles
    running_sum = running_sum + particle(j).weight;
    c_sum(j) = running_sum;
  end
  running_sum
  c_sum
  output = zeros(nparticles, 1);
  output = randsample([1:nparticles], nparticles, true, c_sum); 
  
  output
  

%    sel_index = 0;
%    for j = 1:nparticles
%      sel_index = rand();
%      
%      for i = 1:nparticles
%        if sel_index <= c_sum(i)
%  	sel_index = i;
%  	break;
%        end
%      end
%      
%      tmp_particle(j) = BotSim(map);
%      tmp_particle(j).weight = particle(sel_index).weight;
%      tmp_particle(j).distance = particle(sel_index).distance;
%      tmp_particle(j).o_distance = particle(sel_index).o_distance;
%      tmp_particle(j).setBotPos(particle(sel_index).getBotPos() + rand());
%      tmp_particle(j).setBotAng(particle(sel_index).getBotAng());
%      
%      tmp_particle(j).setScanConfig(tmp_particle(j).generateScanConfig(nscans));
%  
%    end
  
end


