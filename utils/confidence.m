function R1 = confidence (ratings)
    [m n] = size(ratings);
    vecErros = zeros (1,n);
    vecStd = zeros (1,n);
    
        
    
    
    
    for j=1:n
        
        %display ('real:')
        amostra = abs(ratings(:,j));
        
        [maxA ind] = max(amostra);
        %minA = min(amostra);
        %display ('normalizado:')
        %amostra = (amostra-minA)./(maxA-minA)
      
        for i=1:m
            if (i ~= ind)
                erro = sqrt((maxA - amostra(i))^2);                                
            end % if            
        end % for        
        vecErros(j) = erro;  
        vecStd(j) = std(amostra); 
    end % for
    
    
    R1 = sum(vecErros)/n;
    %R2 = prod(vecErros)^(1/n);
    R3 = sum(vecStd)/n;
    



end % function