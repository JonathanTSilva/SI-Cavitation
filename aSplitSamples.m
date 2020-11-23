%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA ELÉTRICA - 1ª TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERTÃOZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIAÇÃO - DIAGNÓSTICO DE FALHAS---------------------
%--------------------------------------------------------------------------

% Variáveis
samples = round((length(Imax)/60))-1;

%Separação dos sinais em 60 amostras e tratamento dos dados:
for(l = 1:60)
    for (m = 1:samples)
        sampleImax(l,m) = Imax((l-1) * samples + m);
    end
end