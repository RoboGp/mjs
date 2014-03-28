% return a list of distances scanned at the specified angle
function USDists2 = ultraScan_rBack(mot, port, power, turns)
mot.ActionAtTachoLimit = 'Brake';
mot.SmoothStart = false;
scanAng = round(360 / turns);
mot.ResetPosition;
USDistances = zeros(turns, 1);
mot.TachoLimit = 360;
mot.Power = -power;
mot.SendToNXT();

counter = 1;
prevAng = -1;
goalAng = -360 + scanAng;
while (prevAng ~= goalAng)
    actualAng = mot.ReadFromNXT().Position;
    if (actualAng ~= prevAng)
        prevAng = actualAng;
        if (mod(actualAng, scanAng) == 0)
            %read data
            USDistance = GetUltrasonic(port);
            if (USDistance > 100)
                USDistance = 100;
            elseif (USDistance < 8)
                USDistance = 8;
            end
            USDistances(counter) = USDistance;
            counter = counter + 1;
        end
    end
end
timeout = WaitFor(mot, 1);

if (timeout)
    mot.Stop('Off');
end

% correct the angle in case the
correctAng_r(mot, power, actualAng, -350);

USDists2 = USDistances;
USDists2(2:end) = flipud(USDists2(2:end));