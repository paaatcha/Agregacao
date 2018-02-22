% Fun��o para gerar os atrasos e gaps das bases de predi��o de dados
% N�o utilizado nas bases de classifica��o

function [ nIN nOUT in out] = predictionConversion( db,nIN,delta )
    nOUT = 1;

    sizeDB = size(db,1);
    n = sizeDB - (nIN*delta);

    full = zeros(n,nIN+1);

    for i=1:nIN+1
       t = 1 + (delta*(i-1));
       full(:,i) = db(t:n+t-1);
    end
    in = full(:,1:nIN);
    out = full(:,nIN+1);

end

