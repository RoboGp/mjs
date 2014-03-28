[sort_w sort_ind] = sort(weight);

pos = pos(sort_ind, :);
ang = ang(sort_ind);
dir = dir(sort_ind, :);

weight = weight(sort_ind);
shift_dist = shift_dist(:, sort_ind);
scan_dist = scan_dist(:, sort_ind);
cross_pts = cross_pts(sort_ind, :, :);



