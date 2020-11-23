%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA ELÉTRICA - 1ª TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERTÃOZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIAÇÃO - DIAGNÓSTICO DE FALHAS---------------------
%--------------------------------------------------------------------------

clear all; close all; clc;

%Caregar dados coletados e tratados
load('dataCav2.mat');

%Atributos e Classe (para todos atributos):
input(:,1:18) = dataCav2(:,2:19);
output(:,1) = dataCav2(:,1);

%Gerar correlação
dataSetCorr = input;
dataSetCorr(:,19) = output;
correlacao = corr(dataSetCorr);

%Atributos e Classe (para 5 atributos):
% input(:,1:5) = dataCav3(:,2:6);
% output(:,1) = dataCav3(:,1);

%Atributos e Classe (para 3 atributos):
% input(:,1) = dataCav4(:,3);
% output(:,1) = dataCav4(:,1);

%faz partição para otimização de hyperparâmetros
cvp = cvpartition(600,'kfold',5);

%Treinamento - SVM
svmStruct = fitcsvm(input,output,...
'Solver','SMO','KernelFunction','rbf',...
'OptimizeHyperparameters','auto',...
'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus','CVPartition',cvp));
    
%Roda SVM com Hyperparâmetros otimizados fazendo cross validação 5 k-fold
for j=1 : cvp.NumTestSets %Quantidade de conjuntos de teste e treinamento
    trIdx = cvp.training(j);
    teIdx = cvp.test(j);
    
    Xtrain = input(trIdx,:);
    Ytrain = output(trIdx,1);
    
    Xtest = input(teIdx,:);
    Ytest = output(teIdx,1);
    
    %Ajuste de gama para sigma para utilizar na função kernel
    %    sigma=sqrt(1/(2*gama));
    sigma = svmStruct.ModelParameters.KernelScale;
    gama = 1/(2*sigma^2);

    %Fator de suavização
    %    C = 0.954;
    C = svmStruct.ModelParameters.BoxConstraint;

    %Treino da SVM
    %figure(1);

    %Treina SVM com hyperparâmetros otimizados e conjunto de treinamento
    svmStruct = fitcsvm(Xtrain,Ytrain,... 
    'Solver','SMO','KernelFunction','rbf','KernelScale',sigma,...
    'BoxConstraint',C);

    %hold on;
    %legend('Inércia Normal','Alta Inércia', 'Vetores Suporte')
    %title('SVM - Conjunto de Dados')
    %xlabel('Atributo 1')
    %ylabel('Atributo 2')

    %Teste da SVM para conjutno de testes
    tic;   
        testClass = predict(svmStruct,Xtest);
    time = toc;

    %Grava os resultados obtidos
    err = 0;
    fp = 0; %False positive
    fn = 0; %False Negative
    tp = 0; %True positive
    tn = 0; %True Negative

    for k=1 : length(testClass)
         if(Ytest(k) ~= testClass(k))
             err = err + 1;
         end
         if (Ytest(k) == 0 && testClass(k) == 1)
             fp = fp + 1;
         end
         if (Ytest(k) == 1 && testClass(k) == 0)
             fn = fn + 1;
         end
         if (Ytest(k) == 1 && testClass(k) == 1)
             tp = tp + 1;
         end
         if (Ytest(k) == 0 && testClass(k) == 0)
             tn = tn + 1;
         end
    end
    
    taxa_acerto = 1-(err/length(testClass));
    
    result(j,1) = j; %Número do conjunto de treinamento/teste
    result(j,2) = gama; %Valor se sigma da função kernel RBF
    result(j,3) = C; %Constante de Suavização
    result(j,4) = err; %Número de amostras classificadas incorretamente
    result(j,5) = taxa_acerto; %Acurácia ou porcentagem de acertos 
    result(j,6) = fp; %False Positive
    result(j,7) = fn; %False Negative
    result(j,8) = tp; %True Positive
    result(j,9 )= tn; %True Negative
    result(j,10) = time;
    
end

%Resumo dos resultados obtidos
erro_medio = mean(result(:,4))/length(testClass)
acerto_medio = mean(result(:,5))
desv_acerto_medio = std(result(:,5))
fp_medio = mean(result(:,6))
fn_medio = mean(result(:,7))
tp_medio = mean(result(:,8))
tn_medio = mean(result(:,9))
time_medio = mean(result(:,10))

%precision = ; 
%recall = ;

result_final = [gama C erro_medio acerto_medio desv_acerto_medio fp_medio fn_medio tp_medio tn_medio time_medio];

%Apagar variáveis:
clearvars sigma gama C erro_medio acerto_medio desv_acerto_medio fp_medio fn_medio tp_medio tn_medio;
clearvars fn fp tn tp time;
clearvars j k;