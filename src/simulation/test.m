%  close all;
%  drawMap;
%  hold on;
%  old = spos;
%  new = spos_new;
%  
%  lines = [[old(1) old(2)];  [new(1) new(2)]];
%  
%  lines2 = [[pt_right(1) pt_right(2)]; [pt_left(1) pt_left(2)]];
%  
%  line(lines(:,1), lines(:,2), 'lineWidth', 2, 'Color', 'b');
%  hold on;
%  line(lines2(:,1), lines2(:,2), 'lineWidth', 2, 'Color', 'g');


 infVec1Point1 = [0 1];
 infVec1Point2 = [3 1];
 infVec1 = [infVec1Point1 infVec1Point2];
 line2Point1 = [3 2];
 line2Point2 = [3 5];
 line2 = [line2Point1 line2Point2];
 
 intersection(infVec1, line2)
 
%   crossingpoint = [1.5 3];
