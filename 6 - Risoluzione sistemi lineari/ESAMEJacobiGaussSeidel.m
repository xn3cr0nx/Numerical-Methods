% Note: nelle funzioni IteraCicli e IteraTolleranza sono presenti anche i
% calcoli dell'errore rispetto alla soluzione esatta e la differenza
% relativa rispetto all'iterazione precedente.
% Inoltre viene anche considerato il raggio spettrale per valutare la
% convergenza.

clear all
clc

A = [2 -1 1;
     2 2 2;
     -1 -1 2];
b = [-1 4 -5]';


soluzione_esatta = [1 2 -1]';

% Scommentare quello che serve
%[T, c] = Jacobi(A, b);
[T, c] = GaussSeidel(A, b);

%% Risoluzione sistema

X = zeros(length(c), 1); % vettore colonna di zeri

num_iterazioni= 4;
X = IteraCicli(T, c, X, num_iterazioni, soluzione_esatta)
%X = IteraTolleranza(T, c, X, 10^-3)