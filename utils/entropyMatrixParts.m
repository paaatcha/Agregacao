% function [ven] = entropyMatrixParts(M)
%     [m,n] = size(M);    
%     mat = ones(m,1);
%    
%     maxEnt = -log2(1/m);   
%     
%     
%     for j=1:n
%         mat = mat .* M(:,j);       
%     end    
%         
%    % the solution quality
%     ven = maxEnt - entropy(mat);
%     
%    %ven = min(ven)./ven;
%    %ven = (ven)./max(ven);
%    %ven = exp(-ven);
% end

function ven = entropyMatrixParts(M)
    [m,n] = size(M);
    
    
    if n>=2
        res = M(:,1);
        for k=1:(n-1)
            aux = res * M(:,k+1)';
            res = reshape(aux,[],1);            
        end           
        maxEnt = -log2(1/length(res)); 
        ven = maxEnt - entropy(res); 
    else
        maxEnt = -log2(1/m); 
        ven = maxEnt - entropy(M);        
    end    

end


