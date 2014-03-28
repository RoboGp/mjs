% return a list of distances scanned at the specified angle
function USDists2 = ultraScan_r(mot, port, power, turns)
mot.ActionAtTachoLimit = 'Brake';
mot.SmoothStart = false;
scanAng = round(360 / turns);
mot.ResetPosition;
USDistances = zeros(turns, 1);
mot.TachoLimit = 180;
mot.Power = power;
mot.SendToNXT();

counter = 1;
prevAng = 0;
goalAng = 180;
while (prevAng ~= goalAng)
    actualAng = mot.ReadFromNXT().Position
    if (actualAng ~= prevAng)
        prevAng = actualAng;
        if (mod(actualAng, scanAng) == 0)
            %read data
            USDistance = GetUltrasonic(port)
            if (USDistance > 60)
                USDistance = 60;
            elseif (USDistance < 8)
                USDistance = 8;
            end
            if (USDistance == -1)
                'negative distance'
            end
            USDistances(counter) = USDistance;
            counter = counter + 1;
        end
    end
end
mot.WaitFor();

mot.TachoLimit = 360;
mot.Power = -power;
mot.SendToNXT();

mot.Power = power;
mot.TachoLimit = 180;

prevAng = 0;
goalAng = 0;
while (prevAng ~= goalAng)
        actualAng = mot.ReadFromNXT().Position
    if (actualAng ~= prevAng)
        prevAng = actualAng;
        if (mod(actualAng, scanAng) == 0)
            %read data
            USDistance = GetUltrasonic(port)
            if (USDistance > 60)
                USDistance = 60;
            elseif (USDistance < 8)
                USDistance = 8;
            end
            if (USDistance == -1)
                'negative distance'
            end
            USDistances(counter) = USDistance;
            counter = counter + 1;
        end
    end
end
mot.WaitFor();
mot.ReadFromNXT().Position;
USDists2 = USDistances;
USDists2(2:end) = USDistances(1:end-1);
USDists2(1) = USDistances(end);
if(USDists2(1) == 60 && (USDists2(2) < 25 || USDists2(end - 1) < 25))
    USDists2(1) = 8;
end
USDists2
% rotate back to the original position
mot.Power = -power;
mot.TachoLimit = 360;
mot.SendToNXT();
mot.WaitFor();