function swapPoints(ilist, a, b)

  temp = ilist(a);
  ilist(a) = ilist(b);
  ilist(b) = temp;

end