function lambda = confidencePCA (mat)

   l1 = (eig(cov(mat')));
   lambda = max(l1)/sum(l1);
   %lambda = sum(l1);


end % function