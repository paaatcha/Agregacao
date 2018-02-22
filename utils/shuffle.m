% Essa fun��o embaralha os dados de uma base de dados respeitando a posi��o
% de cada um deles, ou seja, casando a entrada de sa�da dos dados
% embaralhados
% Entrada: dataIN e dataOUT
% Sa�da: shuffleIN e shuffleOUT
%


function [sIN sOUT] = shuffle(in,out)
    tam = size(in,2);
    pos = randperm(tam);

    for i=1:tam
        sIN(:,i) = in(:,pos(i));
        sOUT(:,i) = out(:,pos(i));
    end
end

