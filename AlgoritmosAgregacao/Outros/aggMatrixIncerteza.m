function [vinc] = aggMatrixIncerteza(M)
    [m,n] = size(M);
    vinc = zeros(m,1);       
    
    
    for i=1:m
        vinc(i) = incerteza(M(i,:));
    end
    
    vinc = min(vinc)./vinc;
end