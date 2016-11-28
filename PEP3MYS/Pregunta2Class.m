classdef Pregunta2Class
    properties
    end
    
    methods (Static)
        %Funcion que procesa la pregunta 2 y retorna resultados
        %importantes, las Distibuciones estacionarias para los 6 estados
        function [P, ArrayNRandom, ArrayNEstate, Frecuencias, Probabilidades, N] = Pregunta2()
            % Matriz de transicion probabilidad
            P = [0   0   1   0   0   0; 
                 0   0   1   0   0   0;
                 1/4 1/4 0   1/4 1/4 0;
                 0   0   1/2 0   0   1/2;
                 0   0   1/2 0   0   1/2;
                 0   0   0   1/2 1/2 0];
            % Ingresar variables de entrada
            prompt = 'Ingrese el numero de variables aleatorias N: \n';
            N = input(prompt);
            % Arreglos para futuro analisis 
            ArrayNRandom = zeros(N,1);
            ArrayNEstate = zeros(N,1);
            % Estados de cadena markov
            Estados = [1 2 3 4 5 6];
            % Estado inicial 1
            ArrayNEstate(1) = Estados(1);
            for i = 2:N
                ArrayNRandom(i) = rand();
                % Analisis por estados %
                if ArrayNRandom(i) < P(ArrayNEstate(i-1),1)
                    ArrayNEstate(i) = Estados(1);
                elseif ArrayNRandom(i) < P(ArrayNEstate(i-1),1) + P(ArrayNEstate(i-1),2)
                    ArrayNEstate(i) = Estados(2);
                elseif ArrayNRandom(i) < P(ArrayNEstate(i-1),1) + P(ArrayNEstate(i-1),2) + P(ArrayNEstate(i-1),3)
                    ArrayNEstate(i) = Estados(3);
                elseif ArrayNRandom(i) < P(ArrayNEstate(i-1),1) + P(ArrayNEstate(i-1),2) + P(ArrayNEstate(i-1),3) + P(ArrayNEstate(i-1),4)
                    ArrayNEstate(i) = Estados(4);
                elseif ArrayNRandom(i) < P(ArrayNEstate(i-1),1) + P(ArrayNEstate(i-1),2) + P(ArrayNEstate(i-1),3) + P(ArrayNEstate(i-1),4) + P(ArrayNEstate(i-1),5)
                    ArrayNEstate(i) = Estados(5);
                elseif ArrayNRandom(i) < P(ArrayNEstate(i-1),1) + P(ArrayNEstate(i-1),2) + P(ArrayNEstate(i-1),3) + P(ArrayNEstate(i-1),4) + P(ArrayNEstate(i-1),5) + + P(ArrayNEstate(i-1),6)
                    ArrayNEstate(i) = Estados(6);
                end
            end
            %se calcula la distribucion estacionaria%
            [Frecuencias, Probabilidades] = Pregunta2Class.DistribucionCM(ArrayNEstate , N, Estados);
            
        end
        
        function [Frecuencias, Probabilidades] = DistribucionCM(ArrayNEstate , N, Estados)
            %Se obtienen frecuencias y distribucion estacionaria%
            %Evaluando frecuencias
            Frecuencias = zeros(6,1);
            for i = 1:N
                if ArrayNEstate(i) == Estados(1)
                    Frecuencias(1) = Frecuencias(1) + 1;
                elseif ArrayNEstate(i) == Estados(2)
                    Frecuencias(2) = Frecuencias(2) + 1;
                elseif ArrayNEstate(i) == Estados(3)
                    Frecuencias(3) = Frecuencias(3) + 1;
                elseif ArrayNEstate(i) == Estados(4)
                    Frecuencias(4) = Frecuencias(4) + 1;
                elseif ArrayNEstate(i) == Estados(5)
                    Frecuencias(5) = Frecuencias(5) + 1;
                elseif ArrayNEstate(i) == Estados(6)
                    Frecuencias(6) = Frecuencias(6) + 1;
                end
            end
            
            %se calculan probabilidades%
            Probabilidades = zeros(6,1);
            Probabilidades(1) = Frecuencias(1)/N;
            Probabilidades(2) = Frecuencias(2)/N;
            Probabilidades(3) = Frecuencias(3)/N;
            Probabilidades(4) = Frecuencias(4)/N;
            Probabilidades(5) = Frecuencias(5)/N;
            Probabilidades(6) = Frecuencias(6)/N;
            
            %se muestran los resultados de las distribuciones estacionarias%
            resultado = 'Distribucion estacionaria: \n';
            disp(resultado);
            Dis1 = 'Distribucion estacionaria Estado - 1';
            disp(Dis1);
            disp(Probabilidades(1));
            Dis2 = 'Distribucion estacionaria Estado - 2';
            disp(Dis2);
            disp(Probabilidades(2));
            Dis3 = 'Distribucion estacionaria Estado - 3';
            disp(Dis3);
            disp(Probabilidades(3));
            Dis4 = 'Distribucion estacionaria Estado - 4';
            disp(Dis4);
            disp(Probabilidades(4));
            Dis5 = 'Distribucion estacionaria Estado - 5';
            disp(Dis5);
            disp(Probabilidades(5));
            Dis6 = 'Distribucion estacionaria Estado - 6';
            disp(Dis6);
            disp(Probabilidades(6));
            
        end
        
    end
    
end

