clf;
clc;
clear all;

map =[0,0;60,0;60,45;45,45;45,59;106,59;106,105;0,105];

bot1 = BotSim(map);  %sets up a botSim object a map

bot1.setBotPos([20 40])
bot1.setBotAng(pi)

bot2 = BotSim(map);  %sets up a botSim object a map

bot2.setBotPos([20 90])
bot2.setBotAng(pi/2)

axis equal;
hold on;
bot1.drawMap();


bot1.drawBot(3);
bot2.drawBot(3);

pweight = zeros(2);


bot1.setScanConfig(bot1.generateScanConfig(20));  %sets the scan configuration on the botSim.  

%  particles(i).drawScanConfig();  %draws the scan configuration to verify it is correct
%  particles(i).drawBot(3);

%You can now try scanning again with the new configuration
[distance1 crossingPoint]  = bot1.ultraScan();
distance1

%Now 20 distances and 20 crossing points are returned
scatter(crossingPoint(:,1),crossingPoint(:,2),'marker','o','lineWidth',3);


bot2.setScanConfig(bot2.generateScanConfig(20));  %sets the scan configuration on the botSim.  

%  particles(i).drawScanConfig();  %draws the scan configuration to verify it is correct
%  particles(i).drawBot(3);

%You can now try scanning again with the new configuration
[distance2 crossingPoint]  = bot2.ultraScan();
distance2

%Now 20 distances and 20 crossing points are returned
scatter(crossingPoint(:,1),crossingPoint(:,2),'marker','o','lineWidth',3);

% Find the matching angle!
min_i = 0;
min_err = inf;


%  weight calculation
%  
%  3. Find best overlap
%  4. Apply gaussian = 18 likelihoods
%  5. Weight = Average of 18 readings.

% Each of the 18 readings, get a weight == likelihood
for i = 1:18
    diff = distance1-distance2;
    diff = diff.*diff;
    sq_err = sum(diff);
    
    if(sq_err < min_err) 
      min_err = sq_err;
      temp_distance = distance2;
    end

    distance2 = circshift(distance2, 1);
end

likelihood = zeros(18, 1);
for i = 1:18
    temp1 = temp_distance(i);
    temp2 = distance1(i);
    [temp1 temp2]
    likelihood(i) = gaussmf(temp1, [3 temp2]);
end

likelihood
mean(likelihood)


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