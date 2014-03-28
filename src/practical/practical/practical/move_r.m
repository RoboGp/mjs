% move the robot a certain distance
% distance: distance to move in cm
% power: the speed at which the motors turn
% forward: a boolean value that indicates whether the robot
% should move forward or backward
function move_r(leftMot, rightMot, distance, power, backward)
    power = ((backward == true) * -power + (backward ~= true) * power);
    
    % motor diameter
    motD = 4.1;
    % motor circumference/distanec per 360 turn
    motC = motD * pi;
    % convert distance to degrees
    degrees = round(360 * distance / motC);
    leftMot.TachoLimit = degrees;
    leftMot.Power = power;
    rightMot.TachoLimit = degrees;
    rightMot.Power = power;
    
    % reset the counters to 0
    leftMot.ResetPosition();
    rightMot.ResetPosition();
    leftMot.SendToNXT();
    rightMot.SendToNXT();
    
    
%     leftDegrees = -1;
%     rightDegrees = -1;
%     while (backward == false && sign(power) * leftDegrees < (degrees-6) && sign(power) * rightDegrees < (degrees-6))
%         leftDegrees = leftMot.ReadFromNXT().Position;
%         rightDegrees = rightMot.ReadFromNXT().Position;
%         if (mod(leftDegrees, 30) == 0)
%             USDistance = GetUltrasonic(SENSOR_2);  
%             if (USDistance > 9 && USDistance < 15)
%                 'STOP!'
%                 leftMot.Stop('Off');
%                 rightMot.Stop('Off');
%                 break;
%             end
%         end
%     end
    
    timeout1 = WaitFor(leftMot, 3);
    timeout2 = WaitFor(rightMot, 3);
    if (timeout1 || timeout2)
        leftMot.Stop('Off');
        rightMot.Stop('Off');
    end

    % correct the angles
%     correctAng(leftMot, power, leftMot.ReadFromNXT().Position, degrees);
%     correctAng(rightMot, power, rightMot.ReadFromNXT().Position, degrees);
end

