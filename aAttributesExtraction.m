%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA ELÉTRICA - 1ª TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERTÃOZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIAÇÃO - DIAGNÓSTICO DE FALHAS---------------------
%--------------------------------------------------------------------------

%Desvio Padrão
for (j = 1:60)
    attributes(j,1) = std(sampleImax(j,:));
end

%Máximo Valor
for (j = 1:60)
    attributes(j,2) = max(abs((sampleImax(j,:))));
end

%Diferença entre máximo e mínimo
for (j = 1:60)
    attributes(j,3) = abs(max(sampleImax(j,:)) - min(sampleImax(j,:)));
end

%Entropia ????????????????
for (j = 1:60)
    attributes(j,4)=0;
    for (i = 1:samples)
        attributes(j,4) = attributes(j,4)+ log10(sampleImax(j,i)^2);
    end
    attributes(j,4) = attributes(j,4) / samples;
end

%Shannon Entropy 
for (j = 1:6)
    attributes(j,5) = wentropy(sampleImax(j,:),'shannon')/(samples-1);
end

%Kurtosis
for (j = 1:60)
    attributes(j,6) = kurtosis(sampleImax(j,:));
end

%Root Mean Square (Média da Raiz Quadrática )
for (j = 1:60)
    attributes(j,7) = rms(sampleImax(j,:));
end

%Skewness(X)
for (j = 1:60)
    attributes(j,8) = skewness(sampleImax(j,:));
end

%Componentes Harmônicas
for (j = 1:60)
    attributes(j,9:18) = GetHarmonics(sampleImax(j,:),1);
end
