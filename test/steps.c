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


