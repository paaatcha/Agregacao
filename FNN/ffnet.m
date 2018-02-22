%Inicializado os dados. Setar os dados de entrada no IN e no OUT. Feito
%assim para ser setado no inicio. Os demais campos s�o utilizados baseado
%no dataIN e dataOUT
%dataIN = vowelsINs; 
%dataOUT = vowelsOUTs;
% Esse script salva um log ao final da execu��o. Essa vari�vel armazena o
% nome da base para complementar o nome do arquivo de log
nomeBase = 'vowels_';

%Embaralhando os dados
%[dataIN dataOUT] = shuffle (dataIN,dataOUT);

%Pegando 70% da entrada e saida para treinamento (classificacao)
% tam = length(dataIN);
% tam70 = round(0.7*tam);
% tam30 = tam-tam70;

%P_treino = dataIN (:,1:tam70);
%T_treino = dataOUT (:,1:tam70);

%P_teste = dataIN(:,(tam70+1):tam);
%T_teste = dataOUT(:,(tam70+1):tam);

tam70 = length (vowelsINsTreino);
tam30 = length (vowelsINsTeste);

% Vari�vel que armazena o n�mero de execu��es para determinada configura��o
% da rede
n_exec = 15;

% erros e tempos armazenam n_exec informa��es para gerar estat�stica em
% cima desses dados
erros = zeros (1,n_exec);
tempos = zeros (1,n_exec);
% S�o dois loops. Esse controlado por a gera a quantidade de neur�nios da
% rede. Atualmente esta 5*a. Portanto ele gera n_exec para uma rede com
% duas camadas de 5*5, 5*6 e 5*7, neur�nios, considerando a=5:7. Para gerar
% s� n_exec de uma configura��o de 50 neur�nios, por exemplo, basta fazer
% a=10:10
for a=4:4
    neuronios = 25;
    for b=1:n_exec
        % Exibe na tela as itera��es. S� para acompanhar o processo
        iteracao =  [a b]
        
        % iniciando o rel�gio
        tic;

        % %inicializando e configurando a rede
        net = feedforwardnet([neuronios neuronios]); %5 neuronios na cada oculta
        net = configure(net,vowelsINsTreino,vowelsOUTsTreino); % configurando de acordo com padr�o de entrada
        % 
        % %Definindo as fun��es de ativa��o e treinamento. Para mudar ou
        % entender melhor, ver o tutorial de RNA no MATLAB
        net.layers{1}.transferFcn = 'logsig';
        net.layers{2}.transferFcn = 'logsig'; 
        %net.layers{3}.transferFcn = 'softmax'; 
        %net.trainParam.lr = 0.001;
        net.trainParam.epochs = 1000;        
        net.trainParam.showWindow = false;        
        
        % Treinando a rede utilizando a toolbox
        %[net,tr] = train(net,P_treino,T_treino,'useParallel','yes');
        %[net,tr] = train(net,vowelsINsTreino,vowelsOUTsTreino);
        
        ind = randperm(tam70);
        batchSize = 150 ;
        iter=1;
        for batch = 1:batchSize:tam70
            iter
            bind = ind(batch:min([batch + batchSize - 1, tam70]));
            
            p = vowelsINsTreino (:,bind);
            t = vowelsOUTsTreino (:,bind);
            [net,tr] = train(net,p,t);%,'useGPU','yes');           
            iter = iter + 1;
        end
        
        % verificando o tempo gasto do treinamento
        tempos(b) = toc;

        % Executando a rede para os cunjunto de dados de teste. Out
        % armazena o resultado da rede
        out = net(vowelsINsTeste);
        nomeArq = strcat(nomeBase,int2str(b));
        nomeArq = strcat(nomeArq,'.txt');
        escreveLimpo (out,nomeArq);
        % Imprime na tela o erro da intera��o para aquela execu��o
        erros(b) = contErros(vowelsOUTsTeste, out);
        taxa(b) = (1-(erros(b)/tam30))*100
        %display (a);
        
        clear net; 
    end
    
    % Gerando o nome do arquivo para salvar no disco. Ele faz as n_exec's e
    % concatena no final do arquivo o n� de neur�nios utilizados. Isso �
    % bom para identificar cada log e evita de sobrescrever o mesmo com
    % mesmo nome. 
    nomeArq = strcat(nomeBase,int2str(5*a));
    nomeArq = strcat(nomeArq,'_FINAL.txt');
    
    % Escrevendo os dados no arquivo de log.
    % Escrevendo: 
    %   porcentagem m�dia de acerto para a base
    %   Qntd de testes
    %   Todos os erros 
    %   M�dia dos erros
    %   Std dos erros
    %   Itera��o com maior erro
    %   Itera��o com menor erro
    %   Todos os tempos
    %   Media dos tempos
    %   Std dos tempos
    %escreve (1-mean(erros)/length(T_teste),length(T_teste),erros,mean(erros),std(erros),max(erros),min(erros),tempos,mean(tempos),std(tempos),nomeArq);
    
    escreve (erros,tempos,'errosetempos.txt');
    
    % Zerando os dados das n_exec anterior
    %erros = zeros (1,n_exec);
    %tempos = zeros (1,n_exec);
end



