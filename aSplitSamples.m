%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA EL�TRICA - 1� TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERT�OZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIA��O - DIAGN�STICO DE FALHAS---------------------
%--------------------------------------------------------------------------

% Vari�veis
samples = round((length(Imax)/60))-1;

%Separa��o dos sinais em 60 amostras e tratamento dos dados:
for(l = 1:60)
    for (m = 1:samples)
        sampleImax(l,m) = Imax((l-1) * samples + m);
    end
end