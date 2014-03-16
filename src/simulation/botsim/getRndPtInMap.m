%---------------------------------------------------
% generate random points inside the map bounds and test if they are inside
% This is probably a terrible way to do this, but it is by far the easiest
% Tests if a point is currently inside the map. Uses the inbuilt inpolygon function
%---------------------------------------------------
bounds = [max(map);  min(map)];

point =  bounds(1,:) + (bounds(2,:) - bounds(1,:)) .* rand(1,2);
inside = inpolygon(point(:,1), point(:,2), inpolygonMapformatX, inpolygonMapformatY);

while(~inside || min(disToLineSeg(point, map_lines)) <  min_wall_dist)
    point =  bounds(1,:) + (bounds(2,:)-bounds(1,:)) .* rand(1,2);
    inside = inpolygon(point(:,1), point(:,2), inpolygonMapformatX, inpolygonMapformatY);
end

