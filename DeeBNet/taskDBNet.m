% res={};
% 
% 
% Creating an object to store train and test data and their labels
% data=DataClasses.DataStore();
% Data value type is gaussian because the value can be consider a real
% value [0 +1]
data=DataClasses.DataStore();
data.valueType=ValueType.probability;

data.trainData = vowelsINsTreino';
data.trainLabels = vec2ind(vowelsOUTsTreino)'-1;
data.testData = vowelsINsTeste';
data.testLabels = vec2ind(vowelsOUTsTeste)'-1;

nomeBase = 'vowels_';

%data = MNIST.prepareMNIST_Small('+MNIST\');%uncomment this line to use a small part of MNIST dataset.


%data.shuffle();
data.validationData=data.testData;
data.validationLabels=data.testLabels;
dbn=DBN('classifier');
data.normalize('meanvar');

erros = zeros (1,15);
tempos = zeros (1,15);

for i=1:15
    dbn=DBN('classifier');

%     % RBM1
%     rbmParams=RbmParameters(100,ValueType.binary);
%     rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
%     rbmParams.performanceMethod='reconstruction';
%     rbmParams.maxEpoch=20;
%     dbn.addRBM(rbmParams);
%     % RBM2
%     rbmParams=RbmParameters(100,ValueType.binary);
%     rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
%     rbmParams.performanceMethod='reconstruction';
%     rbmParams.maxEpoch=20;
%     dbn.addRBM(rbmParams);
%     % RBM3
%     rbmParams=RbmParameters(100,ValueType.binary);
%     rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
%     rbmParams.performanceMethod='reconstruction';
%     rbmParams.maxEpoch=20;
%     dbn.addRBM(rbmParams);
%     % RBM4
%     rbmParams=RbmParameters(100,ValueType.binary);
%     rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
%     rbmParams.performanceMethod='reconstruction';
%     rbmParams.maxEpoch=20;
%     dbn.addRBM(rbmParams);
%     % RBM5
%     rbmParams=RbmParameters(100,ValueType.binary);
%     rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
%     rbmParams.performanceMethod='reconstruction';
%     rbmParams.maxEpoch=20;
%     dbn.addRBM(rbmParams);    

    %RBM6
    rbmParams=RbmParameters(750,ValueType.binary);
    rbmParams.samplingMethodType=SamplingClasses.SamplingMethodType.PCD;
    rbmParams.maxEpoch=1400;
    rbmParams.batchSize = 100;%length(data.testData);
    rbmParams.rbmType=RbmType.discriminative;
    rbmParams.performanceMethod='classification';
    dbn.addRBM(rbmParams);
    %train
    tic;
    dbn.train(data);
    tempos(i) = toc;
    
    
    %test train
    [classNumber,classesSoft]=dbn.getOutput(data.testData,'bySampling');
    errorBeforeBP=sum(classNumber~=data.testLabels)/length(classNumber);
    
    erros(i) = errorBeforeBP
    
    nomeArq = strcat(nomeBase,int2str(i));
    nomeArq = strcat(nomeArq,'.txt');
        
    escreveLimpo (classesSoft',nomeArq);
    
    clear dbn;

end

escreve (erros,tempos,'errosetempos.txt');

%contErros (full(ind2vec(data.testLabels'+1)),classesSoft')/length(classNumber);


%DataClasses.DataStore.plotData({data.testData(1:100,:)},1);



% %BP
% ticID=tic;
% dbn.backpropagation(data);
% toc(ticID);
% %test after BP
% classNumber=dbn.getOutput(data.testData);
% errorAfterBP=sum(classNumber~=data.testLabels)/length(classNumber)
