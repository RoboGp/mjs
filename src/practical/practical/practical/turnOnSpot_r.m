% note that the circumferences could/should be made of a constant values
% degrees: the degrees to turn on the spot
% clockwise: a boolean value that indicates whether
% if the robot should turn clockwise
function turnOnSpot_r(leftMot, rightMot, degreesToTurn, power, clockwise, r_scan_dist, nscans)
    % initialization
    % distance between the motors
    distBetweenMots = 14;
    if (mod(degreesToTurn, 90) ~= 0)
        offset = abs(tan(degtorad(degreesToTurn)) * distBetweenMots / 2);
    else 
        offset = distBetweenMots / 2;
    end

    % motor diameter
    motD = 4.1;
    % motor circumference
    motC = motD * pi;
    % distance travelled after a 360 turn on the spot
    distOnTheSpot360 = distBetweenMots * pi;
    % number of rotations that each wheel has to turn
    % to make the robot turn 360 on the spot
    ratio = distOnTheSpot360 / motC;
    degrees = round(ratio * degreesToTurn);
    r_scan_dist(round(nscans / 2))
    if (offset > r_scan_dist(1))
        reverse = true;
    else 
        reverse = false;
    end
    
    % move forwards a certain distance
    move_r(leftMot, rightMot, offset, 20, reverse);
    
    % start turning
    % reset the counters to 0
    leftMot.ResetPosition();
    rightMot.ResetPosition();
    leftMot.TachoLimit = degrees;
    rightMot.TachoLimit = degrees;
    % bear in mind that power has to be in the range [-100 100]
    leftMotPower = ((clockwise == true) * -power + (clockwise ~= true) * power);
    leftMot.Power = leftMotPower;
    rightMot.Power = -leftMotPower;
    leftMot.SendToNXT();
    rightMot.SendToNXT();
    leftMot.WaitFor();
    rightMot.WaitFor();
    
%     correct 
%     correctAng_r(leftMot, leftMotPower, leftMot.ReadFromNXT().Position, degrees);
%     correctAng_r(rightMot, -leftMotPower, rightMot.ReadFromNXT().Position, degrees);
    
    % move backwards a certain distance
    move_r(leftMot, rightMot, offset, 20, ~reverse);
end

