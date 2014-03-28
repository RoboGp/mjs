%---------------------------------------------------
% CHECK FOR CONVERGENCE
%---------------------------------------------------
function convg_result = checkConvg(particle, nparticles, convg_thresh)
  
  sum = 0;
  convg_result = 0;
  
  for i = nparticles:nparticles/2
    sum += particle(i).weight;
  end
  
  if(sum >= convg_thresh)
    convg_result = 1;
  end
  
end