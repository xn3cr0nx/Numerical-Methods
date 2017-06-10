clear
clc

funzione = 'sin(pi*x)';
funzione3 = '-pi^3 *cos(pi*x)'; % derivata terza
f = inline(funzione);
f3 = inline(funzione3);

% Punti da interpolare
X_points = [0, 1/6, 1/2];
Y_points = f(X_points);
% Punto in cui valutare la funzione
x = 1/4;

P = PolinomioLagrange(X_points, Y_points, f);
fP = inline(P);

fprintf('\n\nFunzione calcolata nel punto %i: %i\n', x, fP(x));
fprintf('\nErrore assoluto: %d\n', abs(fP(x) - f(x))');


%% Calcolo errore Polinomio Lagrange

% Plotto la derivata, SOSTITUISCI BENE GLI ESTREMI, CONSIDERA ANCHE IL
% PUNTO x IN CUI VALUTI LA FUNZIONE
% fplot(funzione3, [0, 1/2]);

max_derivata = 0;
grado_derivata = length(X_points);

err = ErroreLagrange(grado_derivata, max_derivata, f3, x, X_points);

fprintf('Errore massimo teorico: %d\n', err);

fprintf('\nFare un ciclo for per comprendere il caso in cui si hanno più punti da valutare\n\n');

%% DIFF DIVISE


D = DiffDivise(X_points, Y_points)