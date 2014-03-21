clc
close all;
drawMap;
hold on;

spos = [10, 99];
sang = degtorad(270);
sdist = 100;
sang = mod(sang, 2*pi);
sdir = [cos(sang) sin(sang)];

% Known parameters: spos, sang, sdir, sdist
% Must calculate spos_new in while loop
count = 0;
while(sdist) 

  count
  count = count + 1;
  prev_spos = spos;
  
  [spos_new sang sdir] = move(spos, sang, sdir, sdist, 0, 0);
  lines = [[spos(1) spos(2)];  [spos_new(1) spos_new(2)]];
  line(lines(:,1), lines(:,2), 'lineWidth', 2, 'Color', 'b');

  checkIn;
  selMapline;				% gets pt_left, pt_right, cross_pt
  
  if(spos ~= prev_spos)
    'LOOOP'
    continue
  else
    
  end

  findTend;				% finds tend_pt, tend_dir
  findProj;				% finds proj_pt

  plot(proj_pt(1), proj_pt(2), 'g.','MarkerSize',5);
  
  disp([' ' num2str(count) ' ' num2str(pt_left) ' ' num2str(pt_right) '  == ' num2str(sign(tend_dir))])
%    pt_left
%      pt_right
%      tend_dir
%      tend_pt

  % Whether the point goes outside or not..
  % If the proj_pt goes beyond the tend_pt, set it to the tend_pt..
  % Find sdist == abs(tend_pt - proj_pt)
  % Loop all over again.

  checkBeyond;
  setMove;
  
  if(prev_spos == spos)
    break;
  end

end

if(isnan(tend_dir))
  move_pt = tend_pt;
end

plot(move_pt(1), move_pt(2), 'y.','MarkerSize',20);
