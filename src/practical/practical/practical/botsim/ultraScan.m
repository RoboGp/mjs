%---------------------------------------------------
% ultraScan simulates the ultrasound scan.  Returns a vector of
% distances to the walls with the respective crossing points
%
% find intersection point of the scan line and all the map lines in the path of that scan line.
% the distSQ step: magically finds the euclidean distances in one step: (xcps -xbotpos)^2 + (ycps - ybotpos)^2
% find the minimum distance, i.e. the closest point.
% Do a sqrt of that minimum distance to get the actual euclidean distance.
% Save the closest crossing point.
%---------------------------------------------------
updateScanLines;

cps = zeros(length(map_lines), 2, length(scan_lines)); 	%crossingPoints
distances = zeros(size(scan_lines,1), 1);
crossingPoints = zeros(size(scan_lines,1), 2);

botpos_mat = repmat(botpos, length(map_lines), 1); 		% (repeat matrix) preallocate for speed

for i =1:size(scan_lines)
  cps(:,:,i) = intersection(scan_lines(i,:), map_lines) + randn(length(map_lines),2) * sensorNoise;
  distSQ = sum((cps(:,:,i) - botpos_mat).^2, 2);
  [distances(i,:) indices] = min(distSQ);
  distances(i,:) = sqrt(distances(i,:)); 			% only do sqrt once instead of on the entire vector
  crossingPoints(i,:) = cps(indices,:,i);
end

