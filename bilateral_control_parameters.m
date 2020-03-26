% Parametros Pendulo

clear all
close all
clc

Mm = 1; % Masa del maestro [Kg]
Ms = 1; % Masa del esclavo [Kg]
m = 1; % Masa [Kg]
Bm = 20; % Friccion del maestro
Bs = 20; % Friccion del esclavo
ke = 100; % Impedancia del entorno
kh = 10000; % Fuerza del motor del esclavo
Gf = 1; % Ganancia de la reflexion de fuerzas
b = 20; % Impedancia característica del canal de comunicaciones
a = sqrt(2*b); % Relación característica
td = 0.1; % Desfase de tiempo [s]

tsim = 80; % Tiempo de simulacion [s]
control = 2; % Tipo de control bilateral

% Simulacion del modelo
if control == 1
    sim('control_bilateral_fuerza_posicion');
elseif control == 2
    sim('control_bilateral_fuerza_velocidad');
elseif control == 3
    sim('control_bilateral_ondas');
elseif control == 4
    sim('control');
end

if control == 1 % Fuerza-Posicion
    
    % Grafica Posicion
    figure('Name','Control Bilateral Fuerza-Posicion','NumberTitle','Off','Color','White');
    subplot(2,1,1);
    plot(xm.time,xm.data,xs.time,xs.data);
    
    % Configuracion Grafica
    title('Energía (F-P) Posición')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Posición','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    % Grafica Fuerza
    subplot(2,1,2);
    plot(fm.time,fm.data,fs.time,fs.data);
    
    % Configuracion Grafica
    title('Energía (F-P) Fuerza')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Fuerza','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    % Guardar graficas y simulink
    saveas(gcf,'grafica_fuerza_posicion.png')
    print('-scontrol_bilateral_fuerza_posicion','-dpng','control_bilateral_fuerza_posicion.png')
    
elseif control == 2 % Fuerza-Velocidad
    
    % Grafica Posicion
    figure('Name','Control Bilateral Fuerza-Velocidad','NumberTitle','Off','Color','White');
    subplot(2,1,1);
    plot(xm.time,xm.data,xs.time,xs.data);
    
    % Configuracion Grafica
    title('Energía (F-V) Posición')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Posición','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    % Grafica Fuerza
    subplot(2,1,2);
    plot(fm.time,fm.data,fs.time,fs.data);
    
    % Configuracion Grafica
    title('Energía (F-V) Fuerza')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Fuerza','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    % Guardar graficas y simulink
    saveas(gcf,'grafica_fuerza_velocidad.png')
    print('-scontrol_bilateral_fuerza_velocidad','-dpng','control_bilateral_fuerza_velocidad.png')
    
elseif control == 3 % Ondas
    
    % Grafica Posicion
    figure('Name','Control Bilateral Ondas','NumberTitle','Off','Color','White');
    subplot(3,1,1);
    plot(xm.time,xm.data,xs.time,xs.data);
    
    % Configuracion Grafica
    title('Onda Posición')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Posición','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    % Grafica Velocidad
    subplot(3,1,2);
    plot(dxm.time,dxm.data,dxs.time,dxs.data);
    
    % Configuracion Grafica
    title('Onda Velocidad')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Velocidad','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    % Grafica Fuerza
    subplot(3,1,3);
    plot(fm.time,fm.data,fs.time,fs.data);
    
    % Configuracion Grafica
    title('Onda Fuerza')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Fuerza','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    % Guardar graficas y simulink
    saveas(gcf,'grafica_ondas.png')
    print('-scontrol_bilateral_ondas','-dpng','control_bilateral_ondas.png')
    
elseif control == 4 % F-P, F-v y Ondas
    
    figure('Name','Control Bilateral Fuerza-Posicion','NumberTitle','Off','Color','White');
    subplot(2,1,1);plot(xm.time,xm.data,xs.time,xs.data);
    title('Energía (F-P) Posición')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Posición','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    subplot(2,1,2);plot(fm.time,fm.data,fs.time,fs.data);
    title('Energía (F-P) Fuerza')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Fuerza','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    figure('Name','Control Bilateral Fuerza-Velocidad','NumberTitle','Off','Color','White');
    subplot(2,1,1);plot(xm1.time,xm1.data,xs1.time,xs1.data);
    title('Energía (F-V) Posición')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Posición','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    subplot(2,1,2);plot(fm1.time,fm1.data,fs1.time,fs1.data);
    title('Energía (F-V) Fuerza')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Fuerza','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    figure('Name','Control Bilateral Ondas','NumberTitle','Off','Color','White');
    subplot(2,1,1);plot(xm2.time,xm2.data,xs2.time,xs2.data);
    title('Ondas Posición')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Posición','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
    subplot(2,1,2);plot(fm2.time,fm2.data,fs2.time,fs2.data);
    title('Ondas Fuerza')
    xlabel('Tiempo','interpreter','latex')
    ylabel('Fuerza','interpreter','latex')
    legend({'Maestro','Esclavo'},'Location','northeast')
    
end
