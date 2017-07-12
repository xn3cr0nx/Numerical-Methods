clear all
clc

format long

funzione = 'x^3 + 4*x^2 - 10';
f = inline(funzione);

% Sul grafico guarda quanti punti sono da trovare
limiti = [-0.5, 2.5];
fplot(funzione, limiti)

%% METODO BISEZIONE

% Tolleranza richiesta
TOL = 10^-5;
% Iterazioni da stampare
n_iterazioni_max = 3;

% Intervallo iniziale
a = 1;
b = 2;

fprintf('IMPORTANTE: se devi calcolare errore assoluto e relativo, apri il codice\n');
fprintf('bisezione.m e segui indicazioni alla riga 7\n\n');

disp('Metodo Bisezione')
p_bisez = bisezione(f, a, b, n_iterazioni_max, TOL)
fprintf('Valore di f nel punto %d: %d\n', p_bisez, f(p_bisez));

%% Trova seriamente la radice

n_max = 100;
p_bisez = bisezione(f, a, b, n_max, TOL)
fprintf('Valore di f nel punto %d: %d\n', p_bisez, f(p_bisez));


%% METODO NEWTON

% Tolleranza richiesta
TOL = 10^-5;
% Iterazioni da stampare
n_iterazioni_max = 3;

% Intervallo iniziale
p = 1.0;

fprintf('\n----------------------------------\n\n')
disp('Metodo Newton')
p_newton = Newton(f, p, n_iterazioni_max, TOL);
fprintf('Valore di f nel punto %d: %d\n', p_newton, f(p_newton));


%% Trova seriamente la radice

n_max = 100;
p_newton = Newton(f, 1.0, n_max, TOL);
fprintf('Valore di f nel punto %d: %d\n', p_newton, f(p_newton));








