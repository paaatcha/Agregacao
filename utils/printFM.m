% Essa função simplesmente printa na tela as medidas fuzzy de maneira
% organizada. Basta passar a matriz de FM ja com a hash e o nº de elementos
% do grupo que foi calculada a medida

function printFM(FM, nGroups)
    i = nGroups;
    while (i >= 1)        
       combs = combnk (1:nGroups,i);
       nElem = size(combs,1);
       
       for k=1:nElem           
           fm = FM(hash(combs(k,:)));
           fprintf('Grupo(s): [');
           for x=1:size(combs(k,:),2)
               fprintf('%d', combs(k,x));
           end
           fprintf('] - Medida: %f\n', fm);
       end       
       i = i - 1;        
    end %while
    fprintf('\n\n');
end

