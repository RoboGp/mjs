function [radii, angles] = ultraScan(motor,scanSpeed,plotLive)
bufferSize = 600;
angles = zeros(bufferSize,1); %gives plenty of room in the buffer
radii = zeros(bufferSize,1);

if nargin <3 %defaults to no plotting
    plotLive = 0;
end

%motor.stop('Brake'); %cancels any previous movement that may be happening
motor.ActionAtTachoLimit = 'Brake'; % Want precise movment
motor.Power = scanSpeed;
motor.SmoothStart = false; %we want the scan to be as linear as possible
motor.TachoLimit = 360; %1 full rotation
motor.SendToNXT(); %move motor
counter =1;
disp('scanning...');
while 1 %poll the ultrasound sensor as quickly as possible
    %read data
    distance = GetUltrasonic(SENSOR_4);
    data = motor.ReadFromNXT();
    if data.Position >0
        %process data
        if  distance == 255 % sets invalid scans to 0
            radii(counter) = 0;
        else
            radii(counter) = distance;
        end
        
        angles(counter) =  data.Position;        
        counter = counter+1;
    end
    if data.Position > 356 % conservative limit value, you can increase 
        %towards 360, but the scan function may break.  Alternativly if
        %your robot scan gets stuck, you can reduce this number further
        %intil it stops getting stuck. 
        break;
    end
    
end
disp('done');
angles(counter:bufferSize) = []; %gets rid of the empty buffer
radii(counter:bufferSize) = []; %gets rid of the empty buffer
angles = angles.*(pi/180); %convert to radians
if plotLive
    hold off;
    polar(angles,radii);
end
motor.WaitFor();

%move the motor back to it's original position
%you could probably get a second scan at this point if you wanted and merge
%the data. Or just stay at this position until you want to scan again and
%turn the other way to stop the cable getting tangled.
disp('returning to original position');
motor.Power = -scanSpeed;
motor.TachoLimit = 360;
motor.SendToNXT(); %move motor
motor.WaitFor();
