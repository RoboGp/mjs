%  hor1 = [1,0];
%  hor2 = [1,3];
%  
%  ver1 = [0,3];
%  ver2 = [3,3];
%  
%  hor = [hor1 hor2];
%  ver = [ver1 ver2];
%  
%  map = [hor; ver];
%  
%  lineseg1 = [0,2];
%  lineseg2 = [3,2];
%  lineseg = [lineseg1 lineseg2];
%   
%  intersection(hor, ver)
%  intersection(map, lineseg)

%  v1=[4,3]-[0,3]; 
%  v2=[0,2]-[3,0];

%  v1 = [1,0] - [1,0]; 
%  v2 = [3,0] - [1.5,1];

v1 = [2,0] - [2.5,0]; 
v2 = [4,0] - [3,1];

v1 = [4,0] - [2,0]; 
v2 = [3,0] - [4,1];


%  0 to -90 to 180

% 1 to 0 to -1
%  angle = mod( atan2( det([v1;v2]) , dot(v1,v2) ) , 2*pi );

dot(v1,v2)
a1 = atan2( det([v1;v2;]) , dot(v1,v2) );

 a1 = abs((a1>pi/2)*pi-a1)  
 radtodeg(a1)