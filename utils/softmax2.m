% Essa func�o recebe um vetor de sa�da de um classificador e retorna a
% probabilidade de cada classe

function prob = softmax2 (vin)        
    prob = exp(vin)/sum(exp(vin));
end

