%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA ELÉTRICA - 1ª TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERTÃOZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIAÇÃO - DIAGNÓSTICO DE FALHAS---------------------
%--------------------------------------------------------------------------

function y = GetActualCurrent(B1, B0)

%1- Pegar os bytes responsáveis pela corrente máxima:
    %Para valores de entrada em formato HEXADECIMAL:
    %Imax_B1 = hex2dec(B1);  % Byte 1 (MSB)(byte 23 da captura)
    %Imax_B0 = hex2dec(B0);  % Byte 0 (LSB)(byte 24 da captura)

    %Para valores de entrada em formato DECIMAL:
    %Imax_B1 = B1;
    %Imax_B0 = B0;
    
    %Para trabalhar com valores em HEXADECIMAL (se entrada for decimal):
Imax_B1 = dec2hex(B1);
Imax_B0 = dec2hex(B0);
    
%2- Concatenação dos bytes -> Maximum currente I_max:
Imax_h = strcat(Imax_B1,Imax_B0);

%3- Conversão para decimal, obtendo a porcentagem da corrente nominal:
Imax = hex2dec(Imax_h);

y = Imax;
end