%---------------------------------------------------
% FIND LIKELIHOOD OF EACH PARTICLE'S POSITION
% Apply gaussian = 18 likelihoods
% Weight of particle = Average of 18 readings.
%---------------------------------------------------
function assignWeights(robot, particle, nscans, nparticles)

  total_weight = 0;
  likelihood = zeros(nscans, 1);
  
  for j = 1:nparticles
    for i = 1:nscans
      likelihood(i) = gaussmf(particle(j).o_distance(i), [3 robot.distance(i)]);
    end
    particle(j).weight = mean(likelihood);
    total_weight += particle(j).weight;
  end

  for j = 1:nparticles
    particle(j).weight = particle(j).weight / total_weight;
  end

end