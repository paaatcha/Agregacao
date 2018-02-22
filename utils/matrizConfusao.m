% Essa fun��o gera a matriz de confus�o
% Par�metros:
%   real - Sa�da real da base
%   redeFull - Sa�da obtida pelo treinamento
% Retorno:
%   mat - Matriz de confus�o


function mat = matrizConfusao(real, redeFull)
    rede = transform (redeFull); % colocando 1 no maior valor

    [m n] = size(real);
    mat = zeros(m,m);
    cObtd = 0; % Classes obtidas
    cReal = 0; % Classes real
    
    for j=1:n
        for i=1:m
            if (real(i,j) == 1)
                cReal = i;
            end
            
            if (rede(i,j) == 1)
                cObtd = i;
            end
        end
        mat(cReal,cObtd) = mat(cReal,cObtd) + 1;        
    end
end
