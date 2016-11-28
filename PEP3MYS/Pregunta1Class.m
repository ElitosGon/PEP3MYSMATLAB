classdef Pregunta1Class   
    properties
    end
    methods (Static)        
        %Funcion que procesa la pregunta 1
        function [estimacion] = Pregunta1()
            % Evaluo en Monte Carlo
            N = 10000; % Numero de iteraciones
            % Sol = Integral h(x)*p(x)
            % H(x) = xyzln(x + 2y + 3z)
            % p(x) = sen(x + y + z)
            p = @(x)sen(sum(x));
            h = @(x)prod(x)*log([1 2 3]*x);
            X = [1/2 1/2 1/2]; % punto inicial
            aceptados = 0;
            resultado = 0;
            % funcion a estimar 
            p = @(x)prod(X)*log(x(1)*1 + x(2)*2 + x(3)*3)*sin(x(1)+x(2)+x(3));
            % Lim inferiores
            LimInf = [0 0 0];
            LimSup = [1 1 1];
            % factor multiplicador integral
            c = 1;
            for i = 1:3
                c = c*(LimSup(i)-LimInf(i));
            end
            % Iteracions MCMC
            for n = 1:N
                U = rand(1,3);
                Y = X + (U/2) - 1/4; % Y = X + U % nuevo punto
                aceptedprob = p(Y)/p(X); % calculo probabilidad de aceptacion
                u = rand; % obtengo numero aleatorio
                if min(Y) > 0 && max (Y) < 1 && u < aceptedprob
                    X = Y; % Acepted and change
                    aceptados = aceptados + 1;
                    resultado(end+1) = p(X);
                end

            end
            estimacion = c*mean(resultado);
            respuesta = 'Valor esperado: \n';
            disp(respuesta);
            disp(estimacion);
        end
    end
    
end

