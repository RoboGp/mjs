clf;
clc;
clear all;

map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];

nparticles =2;
botSim = BotSim(map);
hold on;
botSim.drawMap();
axis equal;

pweight = zeros(200);

for i =1:nparticles
    particles(i) = BotSim(map);
    particles(i).randomPose(5); %at least 5cm from the wall
    particles(i).drawBot(3);
end

hold on;

for i=1:nparticles
    particles(i).setScanConfig(particles(i).generateScanConfig(20));  %sets the scan configuration on the botSim.  

    particles(i).drawScanConfig();  %draws the scan configuration to verify it is correct
    particles(i).drawBot(3);

    %You can now try scanning again with the new configuration
    [distance crossingPoint]  = particles(i).ultraScan();
    distance
    
    %Now 20 distances and 20 crossing points are returned
    scatter(crossingPoint(:,1),crossingPoint(:,2),'marker','o','lineWidth',3);
end

%  
%  
%  botSim.drawMap();
%  hold on;
%  axis equal;
%  
%  
%  
%  input('Press enter to send the same movement commands to each particle');
%  for i =1:num
%      particles(i).turn(0.1);
%      particles(i).move(20);
%      particles(i).drawBot(3);
%  end
%  
%  input('Remove bots outside the map and generate a new random particle');
%  clf
%  hold off;
%  botSim.drawMap();
%  hold on;
%  axis equal;
%  for i =1:num    
%      if particles(i).insideMap() == 0
%          particles(i).randomPose(5);
%      end
%      particles(i).drawBot(3);
%  end