%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Andr� Pacheco
% Email: pacheco.comp@gmail.com
% Essa fun��o calcula a medida fuzzy baseada na entropia
% 
% Entrada: 
%   mat - Matriz de dados
%
% Sa�da:
%   vFuzzMea - Vetor com todos os valores das medidas fuzzys. A posi�ao do
%   vetor � calculado com a fun��o hash
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  vFuzzMeaEnt = fuzzyMeasureEntropy (mat)
    %nLab = n� de labes e nClass = n� de classificadores
    [nLab, nClass] = size (mat);
        
    % O numero maximo do vetor da 'hash'
    nMax = hash((1:nClass));    
    vFuzzMeaEnt = zeros (1,nMax);
    
    
    % Calculando a entropia dos classificadores
    %vEnt = entropyMatrix(mat);
    
    % Esse Loop vai calcular as combina��es dos classificadores
    i = nClass;  
    % Calculando o valor de JC e hc
    %hc = entropyMatrixParts(mat);
    %hc = 0;
    vEnt = entropyMatrix (mat);
    hc2 = sum(vEnt);
        
    while (i >= 1)        
       combs = combnk (1:nClass,i);        
       vFuzzMeaEnt = calcFuzzMea (combs, vFuzzMeaEnt, vEnt, hc2);        
       i = i - 1; 
    end %while
end %fuzzyMeasute

% Essa matriz vai calcular as medidas fuzzy de fato
function vFuzzMeaEnt = calcFuzzMea (combs, vFuzzMeaEnt, vEnt, hc2)
    %[nLab, nClass] = size (mat); 
    [lin, col] = size (combs);
    % Essa vai ser a matriz com os classificadores recombinados
    %newMat = zeros (nLab, col);      
    
    % Esse for vai fazer a matriz para cada combina��o
    for i=1:lin
        h = recombinaMat (combs(i,:), vEnt);        
        %ent = entropyMatrixParts(newMat);              
        %combs(i,:)        
        %mfEnt = (ent/hc);              
        mfEnt = (h/hc2);
        vFuzzMeaEnt(hash(combs(i,:))) = mfEnt;        
    end %for   
end %calcFuzzMea

% Essa func��o vai fazer a recombina��o da matriz de acordo com as colunas
% dadas pela combina��o corrente
function h = recombinaMat (comb, vEnt)
    tam = size(comb,2);     
    h = 0;
    for i=1:tam        
        %comb(i)
        %newMat (:,i) = mat (:,comb(i));
        h = h + vEnt(comb(i));       
    end %for        
end %recombinaMat

