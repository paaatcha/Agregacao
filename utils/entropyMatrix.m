function [ven] = entropyMatrix(M)
    [m,n] = size(M);
    ven = zeros(1,n);
    
    maxEnt = -log2(1/m);  
    
    for j=1:n
        ven(j) = entropy(M(:,j));        
        %ven(j) = -log2(max(M(:,j)));
    end
    
   % the solution quality
%    maxEnt
%   ven
   ven = maxEnt - ven;
    %ven
   
%    abv = 0.4;
%    tld = 0.3;
      
   
   med = mean(ven);
   %dif = ven - med
   %des = std(ven)
   me = ven > (1.5*med);
   med2 = mean(ven(~me));
   %me = ven > (1.8 * des)
   mx = max(ven(~me));
   ven(me) = med2;%*ven(me);%- dif(me);
   
   %me = ven > (mean(ven)* (1+abv));
   %ven(me) = ven(me) * tld;
   
    
   %ven = min(ven)./ven;
   %ven = (ven)./max(ven);
   %ven = exp(-ven);
end

