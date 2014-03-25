check = 0;
lineseg = [one, two];

botpos_mat = repmat(one, length(pad_map_lines), 1); 		% (repeat matrix) preallocate for speed

% Find the intersection points and the particular map lines being intersected.
cps = intersection(lineseg, pad_map_lines);
distSQ = sum((cps - botpos_mat).^2, 2);
[sort_distSQ sort_index] = sort(distSQ);

index = sort_index(1);

if (cps(index, 1) == node_graph(i, 1) && cps(index, 2) == node_graph(i, 2))
  index = sort_index(2);
end

if (cps(index, 1) == node_graph(j, 1) && cps(index, 2) == node_graph(j, 2))
  check = 1;
end

if(i==2)
  [one two check]
  cps(sort_index, :)
end

