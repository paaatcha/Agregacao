%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: André Pacheco
% Email: pacheco.comp@gmail.com
% This function performs aggregation classifiers through the entropy
% 
% Input:    
%   IN - A matrixtridimensional with all entries
%
% Output:
%   OUT - aggregation array
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function OUT = aggIncerteza (allMats)
    nSamples = size(allMats,1);
    [nLabels, nClass] = size(allMats{1});        
    OUT = zeros(nLabels,nSamples);
            
    % Agregando as entradas para cada Sample:
    for k=1:nSamples
        %ent = repmat(entropyMatrix(allMats{k}), [nLabels, 1]);
        %ent
        %mat = allMats{k}
        %matEnt = ent .* allMats{k}
        
        
        %OUT(:,k) = aggMatrixIncerteza(ent .* allMats{k});
        %OUT(:,k)
        
        OUT(:,k) = aggMatrixIncerteza(allMats{k});
        
        %pause(5)
    end
  
end
