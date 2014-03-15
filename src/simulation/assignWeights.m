%---------------------------------------------------
% FIND LIKELIHOOD OF EACH PARTICLE'S POSITION
% Apply gaussian = 18 likelihoods
% Weight of particle = Average of 18 readings.
%---------------------------------------------------
function total_weight = assignWeights(robot, particle, nscans, nparticles)

  total_weight = 0;
  likelihood = zeros(nscans, 1);
  constant = 0.00002;
  
  for j = 1:nparticles
    for i = 1:nscans
      likelihood(i) = gaussmf(particle(j).o_distance(i), [3 robot.distance(i)]);
    end
    particle(j).weight = mean(likelihood) + constant;
    total_weight = total_weight + particle(j).weight;
  end
  
%    temp = 0;
%    for j = 1:nparticles
%      particle(j).weight = particle(j).weight / total_weight;
%      temp = temp + particle(j).weight;
%    end
%   
%   temp
end