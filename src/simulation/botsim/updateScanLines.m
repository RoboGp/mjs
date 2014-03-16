%---------------------------------------------------
%needs to be called after the robot has moved or turned.  This
%updates the scanLine vectors.  The inner and outer rad set how
%the scanlines are drawn and do not affect the operation of the
%program, Don't set them both to 0 however.
% returns the scan configuration stored as 2d lines
%---------------------------------------------------
function scanLines = updateScanLines(ind, innerRad, outerRad)

  transMat = createTransMat(pos(ind, :)) * createRotMat(ang(ind)) * createTransMat(scanOffset);
  
  scanCenter = translate(scanConfig*innerRad, transMat);
  
  scans =  translate(scanConfig*outerRad, transMat);
  
  scanLines = cat(2, scanCenter, scans);

end
