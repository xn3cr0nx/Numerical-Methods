clear all
clc

%% CIFRE SIGNIFICATIVE
% Il comando "format" stabilisce il numero di cifre stampate.
% Di default, format è "short", che stampa 4 cifre dopo la virgola.
% Invece con "format long" vengono stampate 15 cifre dopo la virgola

format long

%% ERRORE ARROTONDAMENTO NELLA RAPPRESENTAZIONE DI NUMERI
% se fai "sqrt(3.)^2 - 3" non viene 0.
r = sqrt(3)
rq = r^2
rq - 3 % dovrebbe essere 0
rq - 2

% Definizione di una funzione
f = inline ('((1+x)-1)/x', 'x');

res = f(0.00000001) % dovrebbe essere 1
% Nella funzione qui sopra, si ottengono valori sballati se la x assume
% valori tra 0 e 1


%% ERRORE CANCELLAZIONE CIFRE SIGNIFICATIVE
a=1;
b=1;
i=0; % indice per contare il numero di iterazioni
while a+b ~= a
    b=b/2;
    i=i+1;
end

b, i

%% ERRORE OPERAZIONI ARITMETICHE
% Dato che la richiesta della prof richiede la conoscenza del valore
% (pi-22/7) calcolato NON al calcolatore, considero semplicemente 22/7 come
% approssimazione di pi

format short
err_rel = abs(pi - 22/7) / pi
err_rel2 = abs(3.1416 - pi) / pi

%% GRAFICI DI FUNZIONI

x = (0:pi/100:2*pi);
y = sin(x);
% z = cos(x);
plot(x,y)

% Premi un tasto per continuare..
k = waitforbuttonpress;

funzione1 = '5*cos(2*x) -2*x * sin(2*x)';
funzione2 = '5*cos(2*x) -2*x + sin(2*x)';
fplot(funzione1, [-50,50])







