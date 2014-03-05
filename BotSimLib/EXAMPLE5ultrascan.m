%An example of the ultrasound scanning function
clf;        %clears figures
clc;        %clears console
clear;      %clears workspace

COM_CloseNXT all;  
h = COM_OpenNXT();
COM_SetDefaultNXT(h);

OpenUltrasonic(SENSOR_4); %open usensor on port 4
mot = NXTMotor('C');  %motor connected to port C
mot.ResetPosition();  %only do this once at the start
mot.SmoothStart = 1;

%performs a 360 degree scan at 20% power with plotting on
[rad ang] = ultraScan(mot,20,1);

%resamples the scan so the angle between each scan is constant and the
%number of scan points is the same between different scans
[anglesN radiiN] = resampleRadii(ang,rad,100)

%plots the resampled results
polar(anglesN,radiiN,'r');