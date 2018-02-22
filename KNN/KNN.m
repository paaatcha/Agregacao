%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: André Pacheco
% Email: pacheco.comp@gmail.com
% Essa função calcula o algoritmo KNN - K nearest neighboors. A distância
% utilizada é a Euclidiana
% 
% Entrada: 
%   X - matriz de exemplos da base (normalmente 70% da mesma)
%   Y - matriz de classificação dos exemplos X
%   T - matriz com dados para teste (normalmente 30%)
%   k - o valor de k   
%
% Saída:
%   class - matriz com a contagem de quantas distancias mais proximas a
%   classe possui para aquela amostra
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function class = KNN(X,Y,T,k)
    class = zeros (size(Y,1),size(T,2));
    numX = size(X,2);
    numT = size(T,2);
    numY = size(Y,2);
    
    if (numX ~= numY)
        error ('O numero de amostras de X esta diferente do numero de classes');
    end
    
    % Loop para todas as amostras de T
    for i=1:numT
        % Calculando todas a distância da amostra de T para todas as
        % amostras de X. Não é necessários tirar a raíz quadrada
        dists = sum((repmat(T(:,i),[1,numX])-X).^2);
        [distSort posClass] = sort(dists);
        classY = Y(:,posClass(1:k));
        class(:,i) = sum(classY,2);       
    end
end








