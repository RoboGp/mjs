Initialise position and orientation
 - Initialise weights

Scan 360 - 18 readings.

Compare histograms -> Correlation
New Weight = Probability that a particle's reading is same as that of the actual robot. [Use Gaussian dist.]
(P(z|r) = 100% for simulation)

TODO

-> The particular angle.


weight calculation

1. have bot and particle
2. 18 readings  - 1histo == 18 diff shifts! 18 histo
3. Find best overlap
4. Apply gaussian = 18 likelihoods
5. Weight = Average of 18 readings.

resampling

1. Normalize weights
2. Sort all particles based on weights - increasing order.
3. Do the cumulative sum.
4. Roulette selection - do this nparticles times!


Initialise 200 particles with random pose.
Initialise 200 weights.


Distance is column wise.
(row, column)


07-03-14
----------
// TODO
1. Test to set proper threshold for convergence.
   Example: If no. of particles whose cumulative weights > 0.9 is above a particular value, stop!
   
Shortest Path
-------------

Eliminated the wrong lines
----------------------------
robot == rob
a,b,c,d,e,f
1. Connect rob-a rob-b, rob-c, rob-d, rob-e, rob-f
2. Check if rob-a intersects a-b, b-c, c-d, d-e, e-f ... and so on.
3. If rob-a intersects c-d, d-e
4. Sort c-d, d-e
   = find intersection point between rob-a and c-d == X (intersection)
   = find distance between rob and X
5. If the nearest intersction point is a (what we're looking for) then the rob-a is valid.
   
==> We now have a graph!
Shortest path
   


Move
-----
0-45-90-135-180-225-270-315-360


angle = random

dist = 10

while(in map)
  if yes, move!
  if no, turn by 5

    
moveAll()
----------
find good angle, distance for robot
move robot

for each particle
  check if movement is valid for particle
  move particle

PADDING
------
map

Pick first 3 points.
Pick a point on both axis that's '5cm' from the intersection point.



starting angle == random
Pick a distance.
Move that distance in one of 8 directions.

list = angle, dis

4






