%---------------------------------------------------
%generates a simple 360 deg scan configuration.  You can set
%the number of scans to take.
%this function could be static but is not for simplicity
%(no other functions are static and it may be confusing)            
%---------------------------------------------------

startAngle = 0;
endAngle = 2 * pi;
i = startAngle:abs(startAngle-endAngle) / nscans:startAngle+endAngle - abs(startAngle-endAngle) / nscans;
scanConfig =  cat(1,cos(i), sin(i))'*30;


