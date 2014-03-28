% correct the angle of a specified motor
function correctAng_r(mot, power, actualAng, expectedAng)
    % work out the difference between the actual angle turned
    % and the expected angle
%     expectedAng
%     actualAng
    offset = abs(abs(expectedAng) - abs(actualAng));
    mot.TachoLimit = offset;
    if actualAng ~= expectedAng
        mot.Power = (actualAng < expectedAng) * power + (actualAng > expectedAng) * -power;
        mot.SendToNXT();
        mot.WaitFor();
    end
    
end