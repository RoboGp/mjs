%---------------------------------------------------
%moves the robot to a random position and orientation a minimum
%distance away from the walls
%---------------------------------------------------

getRndPtInMap;
pos(ind, :) = point;

angle = rand() * 360;
angle = round(angle);
ang(ind) = degtorad(angle);

dir(ind, :) = [cos(ang(ind)) sin(ang(ind))];

