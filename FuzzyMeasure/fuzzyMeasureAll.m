%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: Andr� Pacheco
% Email: pacheco.comp@gmail.com
% Essa fun��o calcula a medida fuzzy baseada em todos os m�todos (rowley,
% entropy e rowley + entropy
% 
% Entrada: 
%   mat - Matriz de dados
%
% Sa�da:
%   vFuzzMea - Vetor com todos os valores das medidas fuzzys. A posi�ao do
%   vetor � calculado com a fun��o hash
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  [vFuzzMeaRow, vFuzzMeaEnt, vFuzzMeaRowEnt] = fuzzyMeasureAll (mat)
    %nLab = n� de labes e nClass = n� de classificadores
    [nLab, nClass] = size (mat);
        
    % O numero maximo do vetor da 'hash'
    nMax = hash((1:nClass));
    vFuzzMeaRow = zeros (1,nMax);
    vFuzzMeaEnt = zeros (1,nMax);
    vFuzzMeaRowEnt = zeros (1,nMax);
    
    % Calculando a entropia dos classificadores
    %vEnt = entropyMatrix(mat);
    
    % Esse Loop vai calcular as combina��es dos classificadores
    i = nClass;  
    % Calculando o valor de JC e hc
    hc = entropyMatrixParts(mat);
    [Jc, JcEnt] = calcJota (mat,hc);
    
    while (i >= 1)        
       combs = combnk (1:nClass,i);        
       [vFuzzMeaRow, vFuzzMeaEnt, vFuzzMeaRowEnt] = calcFuzzMea (mat, combs, vFuzzMeaRow, vFuzzMeaEnt, vFuzzMeaRowEnt, Jc, JcEnt, hc);        
       i = i - 1; 
    end %while
end %fuzzyMeasute

% Essa matriz vai calcular as medidas fuzzy de fato
function [vFuzzMeaRow, vFuzzMeaEnt, vFuzzMeaRowEnt] = calcFuzzMea (mat, combs, vFuzzMeaRow, vFuzzMeaEnt, vFuzzMeaRowEnt, Jc, JcEnt, hc)
    [nLab, nClass] = size (mat); 
    [lin, col] = size (combs);
    % Essa vai ser a matriz com os classificadores recombinados
    newMat = zeros (nLab, col);      
    
    % Esse for vai fazer a matriz para cada combina��o
    for i=1:lin
        newMat= recombinaMat (mat, newMat, combs(i,:));        
        ent = entropyMatrixParts(newMat);
        [Ja,JaEnt] = calcJota (newMat, ent);
        %combs(i,:)
        mfRow = (Ja/Jc);
        mfEnt = (ent/hc);
        mfRowEnt = (JaEnt/JcEnt);
        
        vFuzzMeaRow(hash(combs(i,:))) = mfRow;        
        vFuzzMeaEnt(hash(combs(i,:))) = mfEnt;
        vFuzzMeaRowEnt(hash(combs(i,:))) = mfRowEnt;
    end %for   
end %calcFuzzMea

% Essa func��o vai fazer a recombina��o da matriz de acordo com as colunas
% dadas pela combina��o corrente
function newMat = recombinaMat (mat, newMat, comb)
    tam = size(comb,2);     
    for i=1:tam        
        %comb(i)
        newMat (:,i) = mat (:,comb(i));
        %ent = ent + vEnt(comb(i));       
    end %for        
end %recombinaMat


function [jota, jotaEnt] = calcJota (newMat, ent)
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

    jotaEnt = jota * ent;   
end %calcJota

