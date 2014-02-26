clf;        %clears figures
clc;        %clears console
clear;      %clears workspace
% close all;
hold on;
axis equal; %keeps the x and y scale the same
map=[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];  %default map

botSim = BotSim(map);  %sets up a botSim object a map, and debug mode on.

botSim.setBotPos([20 40]);
botSim.setBotAng(-pi/2);

botSim.drawMap();
botSim.drawBot(3); % draws robot with direction indicator with a length 3
%the length of the directin indicator does not matter, it just makes it
%easy to see where the robot is pointing
disp('This example shows how to take simulated ultrasound scans.')
input('By default the sensor is set up to scan once directly forward');
[distance crossingPoint]  = botSim.ultraScan()
scatter(crossingPoint(:,1),crossingPoint(:,2),'marker','o','lineWidth',3);

disp('As you can see, the measured distance is 40cm, as you would expect');
disp('The crossing point is marked as the green O.');
input('Press enter to turn and take another scan');
clf; axis equal; hold on; botSim.drawMap();  %resets drawing area

botSim.turn(-pi/2)
[distances crossingPoint]  = botSim.ultraScan() %performs a simulated scan

botSim.drawBot(3);
scatter(crossingPoint(:,1),crossingPoint(:,2),'marker','o','lineWidth',3);

disp('It is not very efficient to only take one scan at a time,')
disp('fortunately it is possible to take multiple scans at once.')
disp('This requires a little setup however.' );
input('This example will show how to set up at 360 degree scan')

botSim.setScanConfig(botSim.generateScanConfig(20),[0 0]);  %sets the scan configuration on the
% botSim.  The other argument will be explained later.

clf; axis equal; hold on; botSim.drawMap();  %resets drawing area
botSim.drawScanConfig();  %draws the scan configuration to verify it is correct
botSim.drawBot(3);

%You can now try scanning again with the new configuration
[distance crossingPoint]  = botSim.ultraScan()
%Now 4 distances and 4 crossing points are returned
scatter(crossingPoint(:,1),crossingPoint(:,2),'marker','o','lineWidth',3);

disp('The distances to the wall are returned along with the intersection points');
disp('The scanLines will update automatically when you turn or move the robot');

disp(' ');
disp('Optional Extra');
disp('Advanced scanConfig setup (not required in most cases)');
input('You need to look at the code and comments for this section');

startAngle =0;
endAngle = pi/2;
samples = 10;
i= startAngle:endAngle/samples:endAngle - endAngle/samples;
scanLines =  [cos(i-pi/4); sin(i-pi/4)]'*100;  %This produces n 2d vectors around the origin.
% Each vector is the direction of the scan.  The *100 factor on the end is not required
%but makes it easier to see when drawing.

scanOffSet = [4 0];  %This sets the center of the scan to [4 0] relative to
%the center of rotation of the robot

botSim.setScanConfig(scanLines,scanOffSet);
botSim.turn(pi+pi/4);

clf; axis equal; hold on; botSim.drawMap();  %resets drawing area
botSim.drawScanConfig();  %draws the scan configuration to verify it is correct
botSim.drawBot(3);
[distance crossingPoint]  = botSim.ultraScan()

%displays crossingPoints
scatter(crossingPoint(:,1),crossingPoint(:,2),'marker','o','lineWidth',3);