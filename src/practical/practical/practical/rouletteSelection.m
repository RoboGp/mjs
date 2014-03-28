%---------------------------------------------------
% ROULETTE-WHEEL SELECTION
% Cumulative Sum
%---------------------------------------------------
running_sum = 0;
c_sum = zeros(nparticles, 1);

% for ind = 1:nparticles
%   running_sum = running_sum + weight(ind);
%   c_sum(ind) = running_sum;
% end
c_sum = cumsum(weight);

rand_ind = zeros(nparticles, 1);
random_method = true;
if(random_method)
    rand_ind = randsample([1:nparticles], nparticles, true, c_sum); 
else
    %rand_ind = randsample([1:nparticles], nparticles, true, c_sum); 
end

jit_pos(:, 1) = pos(rand_ind, 1) + bsxfun(@times, bsxfun(@times, sign(0.5 - rand(nparticles, 1)),rand(nparticles, 1)),weight(rand_ind)) * 100;
jit_pos(:, 2) = pos(rand_ind, 2) + bsxfun(@times, bsxfun(@times, sign(0.5 - rand(nparticles, 1)),rand(nparticles, 1)),weight(rand_ind)) * 100;
inpoly_pos = inpolygon(jit_pos(:, 1), jit_pos(:, 2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);

while(sum(~inpoly_pos) ~= 0)
    jit_pos(inpoly_pos == 0, 1) = pos(inpoly_pos == 0, 1) + bsxfun(@times, bsxfun(@times, sign(0.5 - rand(sum(~inpoly_pos), 1)),rand(sum(~inpoly_pos), 1)),weight(inpoly_pos == 0)) * 100;
    jit_pos(inpoly_pos == 0, 2) = pos(inpoly_pos == 0, 2) + bsxfun(@times, bsxfun(@times, sign(0.5 - rand(sum(~inpoly_pos), 1)),rand(sum(~inpoly_pos), 1)),weight(inpoly_pos == 0)) * 100;
    inpoly_pos = inpolygon(jit_pos(:, 1), jit_pos(:, 2), pad_inpolygonMapformatX, pad_inpolygonMapformatY);
end

pos = jit_pos;

ang = ang(rand_ind);
dir = dir(rand_ind, :);
weight = weight(rand_ind);
shift_dist = shift_dist(:, rand_ind);
scan_dist = scan_dist(:, rand_ind);
cross_pts = cross_pts(rand_ind, :, :);


