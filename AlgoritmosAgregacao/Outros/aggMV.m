%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: André Pacheco
% Email: pacheco.comp@gmail.com
% This function performs aggregation classifiers through marjoritary vote
% 
% Input:    
%   allMats - celula com todas as matrizes a serem agregadas
%
% Output:
%   OUT - aggregation array
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function OUT = aggMV (allMats)
    nSamples = size(allMats,1);
    [nLabels, nClass] = size(allMats{1});        
    OUT = zeros(nLabels,nSamples);
            
    % Agregando as entradas para cada Sample:
    for k=1:nSamples
        OUT(:,k) = sum(transform(allMats{k}),2);
        %OUT(:,k)
    end
    %OUT = transform(OUT);
end

