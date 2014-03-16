if(option == DRAW_ROBOT)
  lineLength = 5;
  plot(r_pos(1), r_pos(2), 'go', 'LineWidth', 3, 'MarkerSize', 5);
  line([r_pos(1) r_pos(1)+r_dir(1)*lineLength], [r_pos(2) r_pos(2)+r_dir(2)*lineLength]);
else
  lineLength = 3;
  plot(pos(ind, 1),pos(ind, 2), 'bo', 'MarkerSize', 5);
  line([pos(ind, 1) pos(ind, 1)+dir(ind, 1)*lineLength], [pos(ind, 2) pos(ind, 2)+dir(ind, 2)*lineLength]);
end


