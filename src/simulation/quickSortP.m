[sort_w sort_ind] = sort(weight);

pos(:, 2) = pos(sort_ind, 2);
ang = ang(sort_ind, 1);
dir(:, 2) = dir(sort_ind, 2);

weight = weight(sort_ind, 1);
shift_dist = shift_dist(:, sort_ind);
scan_dist = scan_dist(:, sort_ind);
cross_pts = cross_pts(sort_ind, :, :);



