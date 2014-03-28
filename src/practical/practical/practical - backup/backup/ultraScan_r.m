% return a list of distances scanned at the specified angle
function USDists2 = ultraScan_r(mot, port, power, turns)
mot.ActionAtTachoLimit = 'Brake';
mot.SmoothStart = false;
scanAng = round(360 / turns);
mot.ResetPosition;
expectedAng = scanAng;
USDistances = zeros(turns, 1);
for i = 1:turns
    mot.TachoLimit = scanAng;
    mot.Power = power;
    % do half of the scans then rotate back to the original position
    if i == round(turns / 2) + 1
        mot.Power = -power;
        % the angle to turn in reverse
        reverseAng = scanAng * (turns - 1);
        mot.TachoLimit = reverseAng;
        % the expected angle from the previous iteration
        expectedAng = (scanAng * (i - 1)) - reverseAng;
    end
    mot.SendToNXT();
    mot.WaitFor(1);
    actualAng = mot.ReadFromNXT().Position
    %read data
    USDistance = GetUltrasonic(port);
    if (USDistance > 60)
        USDistance = 60;
    elseif (USDistance < 8)
        USDistance = 8;
    end
    if (USDistance == -1)
        'negative distance'
    end
    USDistances(i) = USDistance;
    expectedAng = expectedAng + scanAng;
end

% correct the angle in case the
correctAng_r(mot, power, actualAng, 0);
USDists2 = USDistances;
USDists2(2:end) = USDistances(1:end-1);
USDists2(1) = USDistances(end);

% USDists2
% rotate back to the original position
% mot.Power = -power;
% mot.TachoLimit = 360 - scanAng;
% mot.SendToNXT();
% mot.WaitFor();
% correctAng(mot, power, mot.ReadFromNXT().Position, 0);