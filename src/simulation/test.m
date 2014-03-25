one = [node_graph(2, 1), node_graph(2, 2)];
two = [node_graph(1, 1), node_graph(1, 2)];

lineseg = [one, two];

botpos_mat = repmat(one, length(pad_map_lines), 1); 		% (repeat matrix) preallocate for speed

% Find the intersection points and the particular map lines being intersected.
cps = intersection(lineseg, pad_map_lines);
distSQ = sum((cps - botpos_mat).^2, 2);

[sort_distSQ sort_index] = sort(distSQ);

if (cps(sort_index(1), 1) == node_graph(2, 1) && cps(sort_index(1), 2) == node_graph(2, 2))
  check = 1;
end
check