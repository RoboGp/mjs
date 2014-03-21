v1 = [pt_left - pt_right];
v2 = [cross_pt - spos_new];
  
tend_dir = dot(v1,v2);

if(tend_dir > 0)
  tend_pt = pt_right;
else
  tend_pt = pt_left;
end

