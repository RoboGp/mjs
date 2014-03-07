function swapParticles(particle, a, b)

  temp = particle(a);
  particle(a) = particle(b);
  particle(b) = temp;

end