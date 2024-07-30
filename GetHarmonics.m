%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA EL�TRICA - 1� TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERT�OZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIA��O - DIAGN�STICO DE FALHAS---------------------
%--------------------------------------------------------------------------

function y = GetHarmonics(sign, time) 
%time -> tempo da harmonica fundamental (60Hz)
%Considerar 1 segunda pois � o tempo da amostra)
%Componentes Harm�nicas

%% ***********      DOM�NIO DO TEMPO - ANTES TRANSFORMADA       ***********

%An�lise de um per�odo do sinal.
%N�mero de amostras
N = size(sign,2);

%%Intervalo de amostragem (Segundos) para 4 segundos de tempo de ciclo
sampling_interval = time/N;

%Frequ�ncia de amostragem (Hz)
fs = 1/sampling_interval;

%Escalando o sinal original para adequar o eixo x para ms
%eixo_x_ms_sinal_original = [0 : 1 : N-1] *(1/60)*1000/N;

%% ***********   DOM�NIO DA FREQU�NCIA - DEPOIS DA TRANSFORMADA  **********

%Transformada r�pida de fourrier (FFT). Equivalente a transformada discreta
%(DFT), por�m, desenvolvida para velocidade computacional.
%A transformada retorna um vetor (X) com o mesmo n�mero de posi��es (N) do
%vetor de amostras no tempo.

X = fft(sign);

%Para plotar um gr�fico de frequ�ncia(Hz) por amplitude � necess�rio
%escalar o resultado do vetor (X) que a transformada nos fornece.

%Para o eixo x do vetor X, temos N amostras, que v�o de 0 a N-1. O vetor 
%inteiro vai de 0 a fs(Hz), portanto, cada passo, ou cada amostra em X tem
%o valor de: delta_f=fs/N Hz). 
%Podemos, portanto, escrever o vetor eixo_x_hz(Hz):
axis_x_hz = [0 : 1 : (N-1) ]  *fs/N;

%Para o eixo y do vetor X, devemos dividir o m�dulo do vetor N e ent�o
%multiplicar por 2
sign_amplitude = abs(X)*2/N;

%% ******   PLOTANDO OS SINAIS NOS DOM�NIOS DO TEMPO E FREQU�NCIA   *******

half_axis_x_hz = axis_x_hz( 1:((N-1)/2) );
half_sign_amplitude = sign_amplitude( 1 :((N-1)/2) );

%for (i=2:2:30)

for (i=1:10)
    %So harmonicas impares
        %harmonicas(i/2)=metade_amplitude_sinal(i);
    %Todas harmonicas aqui em baixo
        GetHarmonics(i) = half_sign_amplitude(i);

    %harmonicas_POS(j,i)=metade_amplitude_sinal_POS(i);
end

y = GetHarmonics;

