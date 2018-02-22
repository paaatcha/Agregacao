% Essa fun��o conta a quantidade de erros de classifica��o de uma dada base
% dados. Ele simplesmente compara o obtido com o real
% Par�metros:
%   real - Sa�da real da base
%   redeFull - Sa�da obtida pelo treinamento
% Retorno:
%   erros - N�mero de erros encontrados.


function erros = contErros(real, redeFull)
    rede = transform (redeFull); % Colocando 1 no maior valor

    [m n] = size(real);
    dif = real - rede;   
    erros = 0;
    flag = 0;
    
    for j=1:n
        for i=1:m
            if dif(i,j) ~= 0
                flag = 1;
            end
        end
        if flag == 1
            erros = erros + 1;            
        end
        flag = 0;
    end
end

