map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];
min_x = min(map(:, 1)) + 5;
max_x = max(map(:, 1)) - 5;

min_y = min(map(:, 2)) + 5;
max_y = max(map(:, 2)) - 5;

np_x = floor(max_x/5);
np_y = floor(max_y/5);

padlen = 5;
pts_x = (1:np_x) * padlen;
pts_y = (1:np_y) * padlen;

%  pos = [];
%  for i = 1:np_y
%    pos(:, 1) = [pos(:, 1); pts_x];
%    pos(:, 2) = [pos(:, 2); pts_y(i)];
%  end
%  
%  pos

nparticles = np_x*np_y;
pos = zeros(nparticles, 1);

for i = 0:np_x-1
  for j = 0:np_y-1
    pos(i*np_y + j + 1, 1) = pts_x(i+1);
    pos(i*np_y + j + 1, 2) = pts_y(j+1);
  end
end
inpolygonMapformatX = cat(1, map(:,1), map(1,1));
inpolygonMapformatY = cat(1,map(:,2), map(1,2));

inside = inpolygon(pos(:,1), pos(:,2), inpolygonMapformatX, inpolygonMapformatY);
size(pos)
pos = pos(find(inside), :);
size(pos)


%  [pos inside]