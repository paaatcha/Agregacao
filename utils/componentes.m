function comp = componentes(A,PC)
    [mA nA] = size(A);
    [mPC nPC] = size(PC);
    
    comp = zeros (mA,nA);
    
    for i=1:mA
       
        for i2=1:mPC
           
            comp(i,i2) = dot(A(i,:),PC(i2,:));
            
        end
        
        
    end
    



end

