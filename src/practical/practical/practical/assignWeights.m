%---------------------------------------------------
% FIND LIKELIHOOD OF EACH PARTICLE'S POSITION
% Apply gaussian = 18 likelihoods
% Weight of particle = Average of 18 readings.
%---------------------------------------------------
total_weight = 0;
likelihood = zeros(nscans, 1);
constant = 0.0004;

for ind = 1:nparticles
  for i = 1:nscans
    likelihood(i) = gaussmf(shift_dist(i, ind), [10 r_scan_dist_1(i)]);
  end
  weight(ind) = mean(likelihood) + constant;
end

total_weight = sum(weight);
weight = weight / total_weight;

