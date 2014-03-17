%
% Parameters that should be allocated before the script is called.
% delta_angle, botang, botpos, movedist
% Return values
% delta_angle
%
inside = OUT_MAP;

turn_angle =  0.0873;

delta_angle = rand() * 360;
delta_angle = round(delta_angle);
delta_angle = degtorad(delta_angle);

checkPoint;

while (~inside)
  delta_angle = delta_angle + turn_angle;    
  checkPoint;
end
