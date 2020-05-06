%--------------------------------------------------------------------------
% Script para convers�o do vetor packetRawData[] gerado pela
% pcap2mat tool (v.1.0.0 BETA)
% Data: 2020-01-30
%
% Exemplo de uso:
% packets = PacketRawDataConversion(packetRawData);
%--------------------------------------------------------------------------

function ret = PacketRawDataConversion(packetRawData)

%Obt�m tamanho do vetor
tam = size(packetRawData);

%Converte os dados separados por , em array individuais
tam = tam(1);
for i = 1:tam
    packetRawDataS{i} = strsplit(packetRawData{i},',');
end;

clear packetRawData;

%Converte os valores para inteiro (facilitar o processamento dos bytes)
for i = 1:tam
    packetRawData{i} = uint8(hex2dec(packetRawDataS{i}));
end;

%faz a tranposi��o do vetor
packetRawData = packetRawData';

%apaga vari�veis auxiliares da mem�ria
clear packetRawDataS tam i;

ret = packetRawData;