% Essa funcão recebe um vetor de saída de um classificador e retorna a
% probabilidade de cada classe

function prob = softmax2 (vin)        
    prob = exp(vin)/sum(exp(vin));
end

