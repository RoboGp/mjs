%An example of the ultrasound scanning function
clc;        %clears console
clear;      %clears workspace

COM_CloseNXT all;
h = COM_OpenNXT();
COM_SetDefaultNXT(h);

port = SENSOR_2;

OpenUltrasonic(port); %open usensor on port 4
sensorMot = NXTMotor('B');  %motor connected to port C
sensorMot.SmoothStart = true;

leftMot = NXTMotor('C', 'SmoothStart', true, 'ActionAtTachoLimit', 'Brake');
rightMot = NXTMotor('A', 'SmoothStart', true, 'ActionAtTachoLimit', 'Brake');

% ----------
% Scan test
% ----------
% for i=1:2
%     dists = ultraScan_r(sensorMot, port, 30, 45);
%     dists
% end

% ----------
% move test
% ----------
manouvre_r(leftMot, rightMot, 90, true);

% ----------
% turn on the spot test
% ----------
% turnOnSpot(leftMot, rightMot, 90, 20, false);

% ----------
% reading test
% ----------
% dist = GetUltrasonic(port)

CloseSensor(port);
% Close Bluetooth connection.
COM_CloseNXT(h);