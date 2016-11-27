classdef Pregunta3Class   
    properties
    end
    methods (Static)
        % Funcion que permite obtener las evaluaciones de aproximacion al
        % valor de la integral, con el metodo de punto medio para un numero
        % N de particiones.
        function [ PM, error ] = FuncionPM(N, Fx, LimInf, LimSup)
            % se crea arreglo de pariciones
            ArrayPM = LimInf:(LimSup - LimInf)/N:LimSup;
            i=1;
            PM = 0;
            while(i <= N)
                % se calcula la funcion en el punto medio y se acumula
                PM = PM + Fx(ArrayPM(i) + 1/((N)*2));
                i=i+1;
            end
            % se obitene el resultado de la estimacion
            PM = PM/N;
            % se obtiene el error de la estimacion
            error = abs(PM-1);
        end
        
        %Funcion que permite obtneer las evaluaciones de la aproximacion al
        %valor de la integral, con el metodo Monte Carlo para un numero N
        %de iteraciones.
        function [ MC, error ] = FuncionMC(N, Fx, LimInf, LimSup) 
            fx  = 0;
            for i = 1:N
                % se obtienen los numeros aleatorios entre 0 y 1.
                random = rand();
                % se aplica en el intevalo de la integral
                x = LimInf + (LimSup-LimInf)*random; 
                % se acumula el resultado de la evaluacion en la funcion
                fx = fx + Fx(x);        
            end
            % se calula el la aproximacion mediante la formula
            MC = fx*(LimSup - LimInf)/N; 
            % se obtiene el error de la estimacion
            error = abs(MC-1);
        end
        
        %Funcion que grafica el resultado de la convergencia, comparando
        %resultados y errores, se aprecia que aproxima/converge mas rapido
        %el metodo punto medio al aumentar el numero N.
        function [] = plotResult(X, Y1R, Y2R, Y1E, Y2E)
            figure
            ax1 = subplot(2,1,1); % top subplot
            ax2 = subplot(2,1,2); % bottom subplot
            
            plot(ax1,X,Y1R,'b--x',X,Y2R,'g:o');
            title(ax1,'Comparacion convergencia Restultados Metodo Monte Carlo y Punto Medio');
            ylabel(ax1,'Valor de la integral');
            legend(ax1,'Punto Medio','Monte Carlo');
            
            plot(ax2,X,Y1E,'b--x',X,Y2E,'g:o');
            title(ax2,'Comparacion convergencia Errores Metodo Monte Carlo y Punto Medio');
            xlabel(ax2,'Numero de Iteraciones/Particiones');
            ylabel(ax2,'Valor de la integral');
            legend(ax2,'Punto Medio','Monte Carlo');
            
        end
        
        %Funcion que procesa la pregunta 3 y retorna resultados
        %importantes, los resultados del metodo monte carlo y sus errores y
        %los resultado del punto medio y sus errores
        function [MCR, MCE, PMR, PME, INTER] = pregunta3()
            LimInf = 0;
            LimSup = 1;
            Fx = @(x)(3/2)*(1-x^2);

            [PM10, errorPM10]       = Pregunta3Class.FuncionPM(10, Fx, LimInf, LimSup);
            [PM100, errorPM100]     = Pregunta3Class.FuncionPM(100, Fx, LimInf, LimSup);
            [PM500, errorPM500]     = Pregunta3Class.FuncionPM(500, Fx, LimInf, LimSup);
            [PM1000, errorPM1000]   = Pregunta3Class.FuncionPM(1000, Fx, LimInf, LimSup);
            [PM5000, errorPM5000]   = Pregunta3Class.FuncionPM(5000, Fx, LimInf, LimSup);
            [PM10000, errorPM10000] = Pregunta3Class.FuncionPM(10000, Fx, LimInf, LimSup);


            [MC10, errorMC10]       = Pregunta3Class.FuncionMC(10, Fx, LimInf, LimSup);
            [MC100, errorMC100]     = Pregunta3Class.FuncionMC(100, Fx, LimInf, LimSup);
            [MC500, errorMC500]     = Pregunta3Class.FuncionMC(500, Fx, LimInf, LimSup);
            [MC1000, errorMC1000]   = Pregunta3Class.FuncionMC(1000, Fx, LimInf, LimSup);
            [MC5000, errorMC5000]   = Pregunta3Class.FuncionMC(5000, Fx, LimInf, LimSup);
            [MC10000, errorMC10000] = Pregunta3Class.FuncionMC(10000, Fx, LimInf, LimSup);

            MCR = [MC10,MC100,MC500,MC1000,MC5000,MC10000];  
            PMR = [PM10,PM100,PM500,PM1000,PM5000,PM10000];
            INTER = [10,100,500,1000,5000,10000];
            MCE = [errorMC10, errorMC100, errorMC500, errorMC1000, errorMC5000, errorMC10000];
            PME = [errorPM10, errorPM100, errorPM500, errorPM1000, errorPM5000, errorPM10000]; 
            Pregunta3Class.plotResult(INTER,PMR,MCR,PME,MCE);
        end
    end
    
end

