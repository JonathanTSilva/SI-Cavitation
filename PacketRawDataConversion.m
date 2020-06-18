function ret = PacketRawDataConversion(packetRawData)

%Obtém tamanho do vetor
tam = size(packetRawData);

%Converte os dados separados por , em array individuais
tam = tam(1);
for i = 1:tam
    packetRawDataS{i} = strsplit(packetRawData{i},',');
end;

clear packetRawData;

%Converte os valores para inteiro (facilitar o processamento dos bytes)
for i = 1:tam
    %packetRawData{i} = uint8(hex2dec(packetRawDataS{i}));
    packetRawData{i} = uint8(str2double(packetRawDataS{i}));    
end;

%faz a tranposição do vetor
packetRawData = packetRawData';

%apaga variáveis auxiliares da memória
clear packetRawDataS tam i;

ret = packetRawData;
