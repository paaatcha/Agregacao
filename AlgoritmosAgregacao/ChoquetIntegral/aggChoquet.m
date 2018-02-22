%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: André Pacheco
% Email: pacheco.comp@gmail.com
% Essa função agrega as entradas de acordo com a integral de choquet
% desejada
% 
% Input:    
%   allMats - celula com todas as matrizes a serem agregadas
%   which - decide qual tipo de medida fuzzy será utilizada
%
% Output:
%   OUT - vetor de agregação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [OUTRow, OUTEnt, OUTRowEnt] = aggChoquet(allMats, which)
    nSamples = size(allMats,1);
    [nLabels, nClass] = size(allMats{1});
        
    OUTRow = zeros(nLabels,nSamples);
    OUTEnt = zeros(nLabels,nSamples);
    OUTRowEnt = zeros(nLabels,nSamples);
            
    % Agregando as entradas para cada Sample:
    for k=1:nSamples
        %mat = allMats{k}        
        %mat = makeProb(repmat(MV(:,k),[1, nClass]) .* allMats{k});
        
        [OUTRow(:,k), OUTEnt(:,k), OUTRowEnt(:,k)] = aggMatrixChoquet(allMats{k}, which);
        
        %[OUTRow(:,k), OUTEnt(:,k), OUTRowEnt(:,k)] = aggMatrixChoquet(allMats{k}, which);
        %out = OUTEnt(:,k)
        %fprintf ('\n\n\n');
    end
    
end

