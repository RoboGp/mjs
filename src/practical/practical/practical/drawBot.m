lineLength = 5;
if(option ~= 3) 
    scatter(pos(:, 1), pos(:, 2));
    for jack = 1:nparticles
    line([pos(jack,1) pos(jack, 1)+ dir(jack, 1)*lineLength], [pos(jack,2) pos(jack,2)+dir(jack,2)*lineLength]);
    end
else
    scatter(pos(:, 1), pos(:, 2));
    
    jack = 1;
    line([pos(jack,1) pos(jack, 1)+ dir(jack, 1)*lineLength], [pos(jack,2) pos(jack,2)+dir(jack,2)*lineLength]);
end


