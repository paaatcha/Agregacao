%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: André Pacheco
% Email: pacheco.comp@gmail.com
% This function performs aggregation classifiers through the mean
% 
% Input:    
%   allMats - celula com todas as matrizes a serem agregadas
%
% Output:
%   OUT - aggregation array
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function OUT = aggAVG (allMats)
    nSamples = size(allMats,1);
    [nLabels, nClass] = size(allMats{1});        
    OUT = zeros(nLabels,nSamples);
            
    % Agregando as entradas para cada Sample:    
    for k=1:nSamples         
          allMats{k}(:,1) = softmax(allMats{k}(:,1));
          allMats{k}(:,2) = softmax(allMats{k}(:,2));          
          %allMats{k}(:,3) = softmax(allMats{k}(:,3));
          allMats{k}(:,4) = softmax(allMats{k}(:,4));
%         ven = entropyMatrix(allMats{k});
%         ven
%         mat = repmat(ven,[nLabels,1]) .* allMats{k}
        
%         OUT(:,k) = sum(repmat(ven,[nLabels,1]) .* allMats{k},2)/nClass;
        
%         out = OUT(:,k)
%         
%         pause(5)
%         fprintf('\n\n');
        
          %allMats{k}
          OUT(:,k) = sum(allMats{k},2)/nClass;
    end
  
end


