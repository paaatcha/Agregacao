%Inicializado os dados. Setar os dados de entrada no IN e no OUT. Feito
%assim para ser setado no inicio. Os demais campos são utilizados baseado
%no dataIN e dataOUT
dataIN = (susyINs);
dataOUT = susyOUTs;

% Normalizando os dados
%dataIN = dataIN/(max(max(dataIN))); 

% Esse script salva um log ao final da execução. Essa variável armazena o
% nome da base para complementar o nome do arquivo de log
nomeBase = 'susy_';

%Embaralhando os dados
%[dataIN dataOUT] = shuffle (dataIN,dataOUT);

%Pegando 70% da entrada e saida para treinamento (classificacao)
tam = size(dataIN,2);
tam70 = round(0.7*tam);
tam30 = tam - tam70;
inTreino = dataIN (:,1:tam70);
outTreino = dataOUT (:,1:tam70);

inTeste = dataIN(:,(tam70+1):tam);
outTeste = dataOUT(:,(tam70+1):tam);

% Variável que armazena o número de execuções para determinada configuração
% da rede
n_exec = 15;

% erros e tempos armazenam n_exec informações para gerar estatística em
% cima desses dados
erros = zeros (1,n_exec);
tempos = zeros (1,n_exec);
taxa = zeros (1,n_exec);

inTreino = inTreino';
outTreino = outTreino';
inTeste = inTeste';
outTeste = outTeste';


for b=1:n_exec
    tic;
    outELM = ELM (400,inTreino,outTreino,inTeste,outTeste);
    tempos(b) = toc;
    nomeArq = strcat(nomeBase,int2str(b));
    nomeArq = strcat(nomeArq,'.txt');
    escreveLimpo (outELM',nomeArq);
    
    erros(b) = contErros(outTeste',outELM');
    taxa(b) = (1-(erros(b)/tam30))*100
    
   % if (erros(b) <= 72)
   %     break;
   % end
    
end

% mean(erros)/tam30
% 
% nomeArq = strcat(nomeBase,int2str(30));
% nomeArq = strcat(nomeArq,'_FINAL.txt');
%escreve (1-taxa,erros,mean(erros),nomeArq);

escreve (taxa,tempos,'errosetempos.txt');
mean(taxa)
std(taxa)
%(1-mean(taxa)) * 100





