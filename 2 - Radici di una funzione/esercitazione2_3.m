clear all
clc

%% RICERCA RADICI EQUAZIONI NON LINEARI, METODO: BISEZIONE
% Alcuni remainder per il metodo di bisezione:
% p1 = a1 + (b1 - a1)/2
% Poi, in base a f(p1), scegli i nuovi a2 e b2


funzione = 'x^3 + 4*x^2 - 10';
%limiti = [-10, 10];
%limiti = [-5, 5];
limiti = [0.5, 2.5];
%fplot(funzione, limiti)


%% CONFRONTO METODO BISEZIONE E METODO DI NEWTON

format long

funzione = 'x^3 + 4*x^2 - 10';
f = inline(funzione);
TOL = 10^-5;
n_max = 30;

% disp("Metodo Bisezione")
% p_bisez = bisezione(f, 1, 2, n_max, TOL);
% f(p_bisez)


disp("Metodo Newton")
p_newton = Newton(f, 1.0, n_max, TOL);
% f(p_newton)



% Caso f'(p) = 0
% funzione = 'exp(x) -x -1';
% f = inline(funzione);
% TOL = 10^-8;
% 
% p_newton = Newton(f, 1.0, n_max, TOL);
% f(p_newton)
% p_bisez = bisezione(f, -1, 1, n_max, TOL);
% f(p_bisez)


%% ALCUNE FUNZIONI DI MATLAB

% funz = 'sin(2*x)';
% lims = [0, 2*pi];
% fplot(funz, lims)
% 
% w = waitforbuttonpress;
% close
% 
% fnz = inline('sin(3*x)');
% %fplot(fnz, lims) %% Non funziona, fnz è una inline
% 
% y = pi;
% feval(fnz, y) % è uguale a fnz(y)
% 
% y = (0 : pi/10 : 1);
% k = feval(fnz, y); % è uguale a fnz(y)
% plot(y, k)
% 
% w = waitforbuttonpress;
% close
% 
% % Questo qui sotto sembra dare problemi, secondo la prof
% x = (0 : pi/10 : 1);
% y = sin(2*x);
% plot(x, y)
% 
% 
% %% OPERAZIONI DI I/O E GESTIONE DEI FILE
% 
% % Input da utente. L'helper di Matlab è abbastanza esaustivo per più info
% prompt = 'Inserisci un valore numerico: ';
% var = input(prompt);
% result = var*2
% 
% prompt = 'Inserisci una funzione come stringa: ';
% funz = input(prompt, 's');
% f = inline(funz);
% f(5)
% 
% % Output su file
% file = fopen('prova_output.txt', 'wt');
% fprintf(file, 'Sto scrivendo qualcosa su un file. Ci metto la variabile %f', pi);
% 
% 
% 
% 


