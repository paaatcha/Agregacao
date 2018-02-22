function G = confidencePCA2 (mat)

   [t1 t2] = (eig(cov(mat)));
   G = max(t2)/(max(max(t2)));


end % function