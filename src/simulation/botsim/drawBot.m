if(option == DRAW_ROBOT)
  lineLength = 5;
  plot(r_pos(1), r_pos(2), 'go', 'LineWidth', 3, 'MarkerSize', 5);
  line([r_pos(1) r_pos(1)+r_dir(1)*lineLength], [r_pos(2) r_pos(2)+r_dir(2)*lineLength]);
else
%    scatter(pos(:, 1), pos(:, 2), 5, 50, 'LineWidth', 2);
  scatter(pos(:, 1), pos(:, 2));
%    line([pos(:,1) pos(:, 1)+ dir(:, 1)*lineLength], [pos(:,2) pos(:,2)+dir(:,2)*lineLength]);
end

  
