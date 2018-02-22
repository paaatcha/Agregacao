% Essa função constrói as matrizes de tomada de decisão dos
% classificadores. A ideia é montar cada conjunto de labels de cada
% classificador em uma unica matriz (é a matriz Mn do artigo), sendo que
% cada sample terá sua própria matriz

% A função recebe como parametros as matrizes de classificação de cada
% classificador e retornará uma celula, mas com todas as matrizes
% montadas

function allMats = buildClassMats (varargin)
    nClass = nargin;    
    [nLabels, nSamples] = size(varargin{1});    
    allMats = cell (nSamples, 1);
    matDec = zeros (nLabels,nClass);    

    % Para cada sample
    for n=1:nSamples        
        % Para cada classificador (parametro)
        for p=1:nClass                            
            matDec(:,p) = varargin{p}(:,n);                            
        end         
        allMats{n} = matDec;                
    end %nClass    
end

