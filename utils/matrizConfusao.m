% Essa função gera a matriz de confusão
% Parâmetros:
%   real - Saída real da base
%   redeFull - Saída obtida pelo treinamento
% Retorno:
%   mat - Matriz de confusão


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
