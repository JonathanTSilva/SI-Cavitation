%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA ELÉTRICA - 1ª TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERTÃOZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIAÇÃO - DIAGNÓSTICO DE FALHAS---------------------
%--------------------------------------------------------------------------

function y = GetHarmonics(sign, time) 
%time -> tempo da harmonica fundamental (60Hz)
%Considerar 1 segunda pois é o tempo da amostra)
%Componentes Harmônicas

%% ***********      DOMÍNIO DO TEMPO - ANTES TRANSFORMADA       ***********

%Análise de um período do sinal.
%Número de amostras
N = size(sign,2);

%%Intervalo de amostragem (Segundos) para 4 segundos de tempo de ciclo
sampling_interval = time/N;

%Frequência de amostragem (Hz)
fs = 1/sampling_interval;

%Escalando o sinal original para adequar o eixo x para ms
%eixo_x_ms_sinal_original = [0 : 1 : N-1] *(1/60)*1000/N;

%% ***********   DOMÍNIO DA FREQUÊNCIA - DEPOIS DA TRANSFORMADA  **********

%Transformada rápida de fourrier (FFT). Equivalente a transformada discreta
%(DFT), porém, desenvolvida para velocidade computacional.
%A transformada retorna um vetor (X) com o mesmo número de posições (N) do
%vetor de amostras no tempo.

X = fft(sign);

%Para plotar um gráfico de frequência(Hz) por amplitude é necessário
%escalar o resultado do vetor (X) que a transformada nos fornece.

%Para o eixo x do vetor X, temos N amostras, que vão de 0 a N-1. O vetor 
%inteiro vai de 0 a fs(Hz), portanto, cada passo, ou cada amostra em X tem
%o valor de: delta_f=fs/N Hz). 
%Podemos, portanto, escrever o vetor eixo_x_hz(Hz):
axis_x_hz = [0 : 1 : (N-1) ]  *fs/N;

%Para o eixo y do vetor X, devemos dividir o módulo do vetor N e então
%multiplicar por 2
sign_amplitude = abs(X)*2/N;

%% ******   PLOTANDO OS SINAIS NOS DOMÍNIOS DO TEMPO E FREQUÊNCIA   *******

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

