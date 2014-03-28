%turns the robot by an angle and adds noise proportional to the
%amount turned
function [botang botdir] = turn(botang, delta_angle, botdir, turningNoise)
  botang = botang + delta_angle + delta_angle * randn(1) * turningNoise;
  botdir = [cos(botang) sin(botang)];
end
