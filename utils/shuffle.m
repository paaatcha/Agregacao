% Essa função embaralha os dados de uma base de dados respeitando a posição
% de cada um deles, ou seja, casando a entrada de saída dos dados
% embaralhados
% Entrada: dataIN e dataOUT
% Saída: shuffleIN e shuffleOUT
%


function [sIN sOUT] = shuffle(in,out)
    tam = size(in,2);
    pos = randperm(tam);

    for i=1:tam
        sIN(:,i) = in(:,pos(i));
        sOUT(:,i) = out(:,pos(i));
    end
end

