%---------------------------------------------------
% FIND THE BEST SHIFTED HISTOGRAM
% Get the histogram of particle(i) with the best overlap as 
% the robot's histogram
%---------------------------------------------------

nscans = 10;
main = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

temp = circshift(main, 5);
result = zeros(1, 10);

min_err = inf;
angle = 0;
for i = 1:nscans
  diff = main - temp;
  diff = diff.*diff;
  sq_err = sum(diff);
  
  if(sq_err < min_err) 
    min_err = sq_err;
    result = temp;
  end

  temp = circshift(temp, 1);
end
    
result
min_err
