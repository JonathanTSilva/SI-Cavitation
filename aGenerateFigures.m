%-------------------------JONATHAN TOBIAS DA SILVA-------------------------
%----------------------ENGENHARIA ELÉTRICA - 1ª TURMA----------------------
%------------------INSTITUTO FEDERAL- CAMPUS SERTÃOZINHO-------------------
%--------------------------------------------------------------------------
%--------------------INICIAÇÃO - DIAGNÓSTICO DE FALHAS---------------------
%--------------------------------------------------------------------------

%Plotar valores da porcentagem da corrente máxima:
t = (0:2:2*(length(Imax)-1)); %Ajustar para o tempo de cada pacote do simo

figure(1);
%     set(gcf,'units','normalized','outerposition',[0 0 1 1]); %Abrir a figura maximizada
    plot(t,Imax);
    title(fileName);
    xlabel('Reading time (ms)');
    ylabel('Percentage of rated current (%)');
    xlim([0 60000]);
    grid on;

figure(2);
%     set(gcf,'units','normalized','outerposition',[0 0 1 1]);
    plot(t,Imax);
    title(fileName);
    xlabel('Reading time (ms)'); 
    ylabel('Percentage of rated current (%)');
    ylim([0 100]);
    xlim([0 60000]);
    grid on;

% %Salvar figuras automaticamente
% folderFig = '..\Dados\Oficial\graph\116cm\';
% fig1 = figure(1);
% fig1Name = sprintf("%s(1).png",fileName);
% fig1Local = strcat(folderFig,fig1Name);
% saveas(fig1,fig1Local);
% fig2 = figure(2);
% fig2Name = sprintf("%s(2).png",fileName);
% fig2Local = strcat(folderFig,fig2Name);
% saveas(fig2,fig2Local);