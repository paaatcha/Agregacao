function [outELM beta W] = ELM (neuronios,inTreino,outTreino,inTeste,outTeste)

    % inverter do padrão matlab
%     inTreino = inTreino';    
%     outTreino = outTreino';
%     inTeste = inTeste';
%     outTeste = outTeste';
        
    [tam feat] = size(inTreino);
    [tam class] = size(outTreino);
    tamTeste = size(inTeste,1);
    
    inTreino = [inTreino ones(tam,1)]; % adiciona 1 no fim pra multiplicar pelo bias    
    inTeste = [inTeste ones(tamTeste,1)]; % adiciona 1 no fim pra multiplicar pelo bias
    
    % Treinamento
    W = rand([(feat+1) neuronios]); %ultima linha é o bias da camada escondida 
    
%     W = zeros([(feat+1) neuronios]); %ultima linha é o bias da camada escondida   
%     [a,b] = size(W);
%       
%     for i=1:a
%         j = 1;
%         W(i,j) =  rand();
%         for j=1:b
%             W(i,j+1) = 4 * ( W(i,j)*(1-W(i,j)) ); 
%         end
%     end    
    
    H = sigmoid(inTreino*W);    
    beta = pinv(H) * outTreino;
    
    
    % Resultado para o teste
    H = sigmoid(inTeste*W);    
    outELM = (H*beta);
end

