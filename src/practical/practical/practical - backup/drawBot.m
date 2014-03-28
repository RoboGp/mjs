if(option ~= 3) 
    scatter(pos(:, 1), pos(:, 2));
else
    scatter(pos(:, 1), pos(:, 2));
    lineLength = 5;
    jack = 1;
    line([pos(jack,1) pos(jack, 1)+ dir(jack, 1)*lineLength], [pos(jack,2) pos(jack,2)+dir(jack,2)*lineLength]);
end


