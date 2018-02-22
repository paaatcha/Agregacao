% Essa fun��o constr�i as matrizes de tomada de decis�o dos
% classificadores. A ideia � montar cada conjunto de labels de cada
% classificador em uma unica matriz (� a matriz Mn do artigo), sendo que
% cada sample ter� sua pr�pria matriz

% A fun��o recebe como parametros as matrizes de classifica��o de cada
% classificador e retornar� uma celula, mas com todas as matrizes
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

