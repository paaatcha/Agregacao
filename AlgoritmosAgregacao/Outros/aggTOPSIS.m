function OUT = aggTOPSIS (allMats)
    nSamples = size(allMats,1);
    [nLabels, nClass] = size(allMats{1});        
    OUT = zeros(nLabels,nSamples);
    vector_cost_or_benefit = zeros (1,nClass);
    %w = ones(1,nClass)/nClass;
            
    % Agregando as entradas para cada Sample:
    for k=1:nSamples
        ent = entropyMatrix(allMats{k});
        w = ent/sum(ent);        
        dm = TOPSIS (allMats{k},w,vector_cost_or_benefit);        
        
%         allMats{k}
%         ent
%         w
%         dm.rCloseness               
% 
%         fprintf('\n\n\n');
        
        OUT(:,k) = dm.rCloseness;
        %OUT(:,k)
    end
  
end