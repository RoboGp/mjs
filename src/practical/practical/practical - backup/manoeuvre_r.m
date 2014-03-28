% move the robot a certain distance
% distance: distance to move in cm
% power: the speed at which the motors turn
% forward: a boolean value that indicates whether the robot
% should move forward or backward

%false left
function manoeuvre_r(leftMot, rightMot, power, direction)
    move_r(leftMot, rightMot, 19, 70, true);
   
    % motor diameter
    motD = 4.1;
    % motor circumference/distanec per 360 turn
    motC = motD * pi;
    % convert distance to degrees
    if(~direction)
        degL = round(360 * 30 / motC);
        degR = round(360 * 7 / motC);
        powerL = power;
        powerR = round(powerL * 0.23);
    else
        degR = round(360 * 30 / motC);
        degL = round(360 * 7 / motC);
        powerR = power;
        powerL = round(powerR * 0.23);
    end
    leftMot.TachoLimit = degL;
    leftMot.Power = powerL;
    rightMot.TachoLimit = degR;
    rightMot.Power = powerR;
    
    % reset the counters to 0
    leftMot.ResetPosition();
    rightMot.ResetPosition();
    leftMot.SendToNXT();
    rightMot.SendToNXT();
    
    leftMot.WaitFor();
    rightMot.WaitFor();
    

    move_r(leftMot, rightMot, 8, 70, true);
    % correct the angles
%     correctAng(leftMot, power, leftMot.ReadFromNXT().Position, degrees);
%     correctAng(rightMot, power, rightMot.ReadFromNXT().Position, degrees);
end

