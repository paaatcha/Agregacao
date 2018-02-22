%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Andr� Pacheco
% Email: pacheco.comp@gmail.com
% Essa fun��o calcula a medida fuzzy baseada no novo m�todo proposto por
% Rowel et al. 
% 
% Entrada: 
%   mat - Matriz de dados
%
% Sa�da:
%   vFuzzMea - Vetor com todos os valores das medidas fuzzys. A posi�ao do
%   vetor � calculado com a fun��o hash
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  vFuzzMea = fuzzyMeasure (mat)
    %nLab = n� de labes e nClass = n� de classificadores
    [nLab nClass] = size (mat);
        
    % O numero maximo do vetor da 'hash'
    nMax = hash((1:nClass));
    vFuzzMea = zeros (1,nMax);
    
    % Esse Loop vai calcular as combina��es dos classificadores
    i = nClass;  
    % Calculando o valor de JC
    Jc = calcJota (mat);
    
    while (i >= 1)        
       combs = combnk (1:nClass,i);
        
       vFuzzMea = calcFuzzMea (mat, combs, vFuzzMea, Jc);
        
       i = i - 1; 
    end %while
end %fuzzyMeasute

% Essa matriz vai calcular as medidas fuzzy de fato
function vFuzzMea = calcFuzzMea (mat, combs, vFuzzMea, Jc)
    [nLab nClass] = size (mat); 
    [lin col] = size (combs);
    % Essa vai ser a matriz com os classificadores recombinados
    newMat = zeros (nLab, col);      
    
    % Esse for vai fazer a matriz para cada combina��o
    for i=1:lin
        [newMat] = recombinaMat (mat, newMat, combs(i,:));        
        Ja = calcJota (newMat);
        %combs(i,:)
        mf = (Ja/Jc);
        vFuzzMea(hash(combs(i,:))) = mf;        
    end %for   
end %calcFuzzMea

% Essa func��o vai fazer a recombina��o da matriz de acordo com as colunas
% dadas pela combina��o corrente
function [newMat] = recombinaMat (mat, newMat, comb)
    tam = size(comb,2); 
    for i=1:tam        
        newMat (:,i) = mat (:,comb(i));      
    end %for    
end %recombinaMat


function jota = calcJota (newMat)
    autoVals = eig(cov(newMat));
    %autoVals = eig(corr(newMat));
    tam = size(autoVals,1);
    jota = 0;
    
    for i=1:tam
       if (autoVals(i) >= 1)
           jota = jota + 1;
       else
           jota = jota + autoVals(i);
       end %if       
    end %for          

%     jota = entropy(autoVals); 
end %calcJota








