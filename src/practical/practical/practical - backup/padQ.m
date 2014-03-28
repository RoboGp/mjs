new_map = map;
len_map = length(map);
visibility_graph = [];

for i = 1:len_map
  newPts = [map(i, 1) - 1,map(i, 2);
	    map(i, 1) + 1,map(i, 2);
	    map(i, 1),map(i, 2) + 1;
	    map(i, 1),map(i, 2) - 1];
  if(sum(inpolygon(newPts(:, 1), newPts(:, 2), inpolygonMapformatX, inpolygonMapformatY)) == 4)
      visibility_graph = [visibility_graph; [map(i, 1) map(i, 2)]];
  end
  
  newPts = [map(i, 1) - 5,map(i, 2) - 5;
	    map(i, 1) - 5,map(i, 2) + 5;
	    map(i, 1) + 5,map(i, 2) + 5;
	    map(i, 1) + 5,map(i, 2) - 5];
  
  out = inpolygon(newPts(:, 1), newPts(:, 2), inpolygonMapformatX, inpolygonMapformatY);
  index =  find(out);
  out_ind = find(out == 0);
  in_ind = (length(index) > 1)*(out_ind(1) + (out_ind(1) <= 2)*2 - (out_ind(1) > 2)*2) + (length(index) == 1)*index(1);
  new_map(i, :) = newPts(in_ind, :);
end

pad_inpolygonMapformatX = cat(1, new_map(:,1), new_map(1,1));
pad_inpolygonMapformatY = cat(1,new_map(:,2), new_map(1,2));

line(new_map(:,1), new_map(:,2), 'lineWidth', 2, 'Color', 'g');
