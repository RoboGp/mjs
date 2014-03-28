new_map = map;
for i = 1:length(map)
  newPts = [map(i, 1) - 5,map(i, 2) - 5;
	    map(i, 1) - 5,map(i, 2) + 5;
	    map(i, 1) + 5,map(i, 2) + 5;
	    map(i, 1) + 5,map(i, 2) - 5];
  
  out = inpolygon(newPts(:, 1), newPts(:, 2), inpolygonMapformatX, inpolygonMapformatY);
  index =  find(out);
  
  if(length(index) > 1)
    out_ind = find(out == 0);
    
    if(out_ind == 1)
      in_ind = 3;
    elseif(out_ind == 2)
      in_ind = 4;
    elseif(out_ind == 3)
      in_ind = 1;
    else
      in_ind = 2;
    end
    
    new_map(i, :) = newPts(in_ind, :);
  else
    new_map(i, :) = newPts(index, :);
  end
  
end

pad_inpolygonMapformatX = cat(1, new_map(:,1), new_map(1,1));
pad_inpolygonMapformatY = cat(1,new_map(:,2), new_map(1,2));

%  line(new_map(:,1), new_map(:,2), 'lineWidth', 2, 'Color', 'g');
