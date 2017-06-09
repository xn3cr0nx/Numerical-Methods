% clear all
% clc
% 
% % Esempio 4 del libro
% % x_points = [1.0 1.3 1.6 1.9 2.2];
% % y_points = [0.7651977 0.6200860 0.4554022 0.2818186 0.1103623]
% 
%% ESERCIZIO 2
clear all
clc

funzione = '1/x';

limiti = [1.5, 4.5];
% fplot(funzione, limiti)

x_points = [2 2.75 4];
y_points = 1./x_points;
x = 3;


P = PolinomioLagrange(x_points, y_points);
f = inline(P);
fprintf('\nFunzione calcolata nel punto %i: %i\n', x, f(x));

fprintf('\n\n');


DD = DiffDivise(x_points, y_points);
grado = length(x_points) - 1; % grado massimo possibile del polinomio
P = PolinomioDiffDivise(DD, x_points, grado);
fprintf('Polinomio raggruppato da matlab P%i = %s\n', length(x_points)-1, P);
disp('Non scrivere così ma nella forma di sommatoria di prodotti')
disp('tra elemento della diagonale di DD produttoria (x-x0)(x-x1)....\n');
f = inline(P);
fprintf('Funzione calcolata nel punto %i: %i\n', x, f(x));


%% ESERCIZIO 3, Aggiungo il quarto nodo
% x_points(4) = 3.5;
% y_points(4) = 1./3.5;
% fprintf('\n\n');
% P = PolinomioLagrange(x_points, y_points);
% f = inline(P);
% fprintf('Funzione calcolata nel punto %i: %i\n', x, f(x));
%  
% 
%% ESERCIZIO 4, POLINOMI DI LAGRANGE
clear all
clc

format long
x_points = [0.1 0.2 0.3 0.4];
y_points = [-0.62049958 -0.28398668 0.00660095 0.24842440];
x = 0.25;
P1 = PolinomioLagrange(x_points, y_points);
f = inline(P1);

sym x;
funzione = x*cos(x)-2*x^2+3*x-1;
funzione = 2*x;
% f = inline(funzione);
% fprintf('\nFunzione calcolata nel punto %i: %i\n', x, f(x));
fprintf('\nDerivata grado %i:', length(x_points)); 
df = diff(funzione);
df
% 
% Manca la parte della stima dell'errore massimo, penso si intenda l'errore
% di Lagrange, non ho voglia di farlo adesso

%% ESERCIZIO 5, DIFFERENZE DIVISE
% clear all
% clc
% 
% format short
% 
% limiti = [-10 20]; % limiti del grafico
% 
% x_points = [0.0 0.1 0.3 0.6 1.0];
% y_points = [-6.00000 -5.89483 -5.65014 -5.17788 -4.28172];
% 
% D1 = DiffDivise(x_points, y_points);
% 
% grado = length(x_points) - 1; % grado massimo possibile del polinomio
% P1 = PolinomioDiffDivise(D1, x_points, grado)
% 
% 
% x_points(6) = 1.1;
% y_points(6) = -3.99583;
% 
% 
% 
% D2 = DiffDivise(x_points, y_points);
% 
% grado = length(x_points) - 1; % grado massimo possibile
% P2 = PolinomioDiffDivise(D2, x_points, grado)
% 
% 
% fplot(P1, limiti)
% hold on
% fplot(P2, limiti)