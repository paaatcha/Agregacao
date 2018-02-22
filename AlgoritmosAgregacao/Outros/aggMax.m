%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: André Pacheco
% Email: pacheco.comp@gmail.com
% This function performs aggregation classifiers through the argmax
% 
% Input:    
%   allMats - celula com todas as matrizes a serem agregadas
%
% Output:
%   OUT - aggregation array
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function OUT = aggMax (allMats)
    nSamples = size(allMats,1);
    [nLabels, nClass] = size(allMats{1});        
    OUT = zeros(nLabels,nSamples);
            
    % Agregando as entradas para cada Sample:
    for k=1:nSamples
        OUT(:,k) = max(allMats{k},[],2);
    end
  
end
