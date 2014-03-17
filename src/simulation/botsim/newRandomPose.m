%---------------------------------------------------
%moves the robot to a random position and orientation a minimum
%distance away from the walls
%---------------------------------------------------

padlen = 5;

min_x = min(map(:, 1)) + padlen;
max_x = max(map(:, 1)) - padlen;

min_y = min(map(:, 2)) + padlen;
max_y = max(map(:, 2)) - padlen;

np_x = floor(max_x/(padlen*2));
np_y = floor(max_y/(padlen*2));

pts_x = (1:np_x) * padlen*2;
pts_y = (1:np_y) * padlen*2;

nparticles = np_x*np_y;
pos = zeros(nparticles, 1);

for i = 0:np_x-1
  for j = 0:np_y-1
    pos(i*np_y + j + 1, 1) = pts_x(i+1);
    pos(i*np_y + j + 1, 2) = pts_y(j+1);
  end
end
inside = inpolygon(pos(:,1), pos(:,2), inpolygonMapformatX, inpolygonMapformatY);
pos = pos(find(inside), :);

nparticles = length(pos);


angle = rand(nparticles, 1) * 360;
angle = round(angle);
ang = degtorad(angle);

dir = [cos(ang) sin(ang)];
