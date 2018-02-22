%Inicializado os dados. Setar os dados de entrada no IN e no OUT. Feito
%assim para ser setado no inicio. Os demais campos são utilizados baseado
%no dataIN e dataOUT
% dataIN = skinINs; 
% dataOUT = skinOUTs;
% Esse script salva um log ao final da execução. Essa variável armazena o
% nome da base para complementar o nome do arquivo de log
nomeBase = 'vowels_';

%Embaralhando os dados
%[dataIN dataOUT] = shuffle (dataIN,dataOUT);

%Pegando 70% da entrada e saida para treinamento (classificacao)
% tam = length(dataIN);
% tam70 = round(0.7*tam);
% tam30 = tam-tam70;
% vowelsINsTreino = dataIN (:,1:tam70);
% vowelsOUTsTreino = dataOUT (:,1:tam70);
% 
% vowelsINsTeste = dataIN(:,(tam70+1):tam);
% outTeste = dataOUT(:,(tam70+1):tam);

% Variável que armazena o número de execuções para determinada configuração
% da rede
n_exec = 1;

% erros e tempos armazenam n_exec informações para gerar estatística em
% cima desses dados
%erros = zeros (1,n_exec);
%tempos = zeros (1,n_exec);

tam70 = size (vowelsINsTreino,2);
tam30 = size (vowelsINsTeste,2);

k = round(sqrt(tam70));
if (mod(k,2) == 0)
    k = k + 1;
end
k = 17



for b=1:n_exec
    outKNN = KNN(vowelsINsTreino,vowelsOUTsTreino,vowelsINsTeste,k);
    %outKNN = sigmoid(outKNN);
        
    nomeArq = strcat(nomeBase,int2str(b));
    nomeArq = strcat(nomeArq,'.txt');
    escreveLimpo (outKNN,nomeArq);
    
    erro = contErros(vowelsOUTsTeste,outKNN)
    taxa = (1-(erro/tam30))*100
end

nomeArq = strcat(nomeBase,int2str(30));
nomeArq = strcat(nomeArq,'_FINAL.txt');
escreve (taxa,nomeArq);

