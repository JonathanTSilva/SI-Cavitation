%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA ELÉTRICA - 1ª TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERTÃOZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIAÇÃO - DIAGNÓSTICO DE FALHAS---------------------
%--------------------------------------------------------------------------

clear all; close all; clc;

% Variáveis
j = 1;
k = 1;

%1- Carregar banco de dados:
fileName = "x";
file = sprintf("%s.mat", fileName);
folder = "..\Dados\Oficial\mat\116cm\";
dir = strcat(folder,file);
load(dir);

%2- Convertê-lo para arrays:
packetRawData = PacketRawDataConversion(packetRawData);

%3- Coletar dados das correntes e tensões, enviadas pelo Simocode:
    %Verificar qual a origem:
        % Se a origem for do CLP - Coletar SP (Setpoint de Corrente)
        % Se a origem for do Simocode - Coletar Im (Corrente Máxima)
        % Como complemento: I1, I2, I3 e V1, V2, V3;
for i=1:length(packetRawData)
    %1 Byte responsável por dizer a origem do pacote:
    frame = packetRawData{i}(12);
    %Quando o byte 12 for igual a #FEh, o pacote é oriundo do SIMOCODE
    if (frame == 200)
        Imax(j) = GetActualCurrent(packetRawData{i}(23),packetRawData{i}(24));
        j = j + 1;
    end
   %Quando o byte 12 for igual a #C8h, o pacote é oriundo do CLP
%    if (frame == 254)
%        k = k + 1;
%    end
end

%4- Dividir amostras:
aSplitSamples;

%5- Extrair atributos e gerar harmônicas:
aAttributesExtraction;

%6- Exportar attributes para csv:
csvName = sprintf("%s.csv",fileName);
csvwrite(csvName,attributes,0);

%- Gerar gráficos:
aGenerateFigures;

%Apagar variáveis:
clearvars file folder dir folderFig fig1 fig1Name fig1Local fig2 fig2Name fig2Local;
