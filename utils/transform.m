% Essa função recebe uma matriz de saída da rede e retorna uma outra matriz
% colocando 1 no maior valor e 0 nos demais
% Exemplo:
%      0.1 0.3  0.9
% In = 0.3 0.01 0.2
%      0.9 0.8  0.1
%
%       0 0 1
% Out = 0 0 0
%       1 1 0
%


function Vout = transform(Vin)
    [m n] = size(Vin);
    Vout = zeros (m,n);
    maior = 0;
    
    if (m>1)
        for j=1:n              
           for i=1:m
                if (Vin(i,j) >= maior)
                    maior = Vin(i,j);
                    pos = i;
                end
           end
           Vout(pos,j) = 1;
           maior = 0;
        end
    else
        for j=1:n
                if (Vin(1,j) >= 0.5)
                    Vout(1,j) = 1;
                end
        end
    end
    

end

