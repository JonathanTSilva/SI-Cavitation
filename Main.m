%-------------------JONATHAN TOBIAS DA SILVA-------------------
%----------------ENGENHARIA EL�TRICA - 1� TURMA----------------
%------------INSTITUTO FEDERAL- CAMPUS SERT�OZINHO-------------
%--------------------------------------------------------------
%--------------INICIA��O - DIAGN�STICO DE FALHAS---------------
%--------------------------------------------------------------

clear all; close all; clc;

% Vari�veis
j = 1;
k = 1;

%1- Carregar banco de dados:
load('test2-24.mat');

%2- Convert�-lo para arrays:
packetRawData = PacketRawDataConversion(packetRawData);

%3- Coletar dados das correntes e tens�es, enviadas pelo Simocode:
    %Verificar qual a origem:
        % Se a origem for do CLP - Coletar SP (Setpoint de Corrente)
        % Se a origem for do Simocode - Coletar Im (Corrente M�xima)
        % Como complemento: I1, I2, I3 e V1, V2, V3;
for i=1:length(packetRawData)
    %1 Byte respons�vel por dizer a origem do pacote:
    frame = packetRawData{i}(12);
    %Quando o byte 12 for igual a #FEh, o pacote � oriundo do SIMOCODE
    if (frame == 200)
        Imax(j) = GetActualCurrent(packetRawData{i}(23),packetRawData{i}(24));
        j = j + 1;
    end
   %Quando o byte 12 for igual a #C8h, o pacote � oriundo do CLP
%    if (frame == 254)
%        k = k + 1;
%    end
end

%4- Apagar vari�veis extras:

%5- Plota valores da porcentagem da corrente m�xima:
t = (0:2:2*(length(Imax)-1)); %Ajustar para o tempo de cada pacote do simo
figure(1);
plot(t,Imax);
xlabel('Reading time (ms)') 
ylabel('Percentage of rated current (%)') 
grid on;

