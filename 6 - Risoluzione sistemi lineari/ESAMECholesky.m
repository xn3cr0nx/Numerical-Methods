clear
clc

% Per matrici definite positive, si può usare Cholesky (LLt) oppure LDLt
% Vedi pag. 343 del pdf (328 del libro)

A = [4 1 1 -1;
     1 3 -1 1;
     1 -1 2 0;
     -1 1 0 2];

b = [0.65 0.05 0 -0.5]';


L = Cholesky(A)
fprintf('\nVerifica che la fattorizzazione sia corretta, confronta A con questo risultato:');
L*(L')

%% Soluzione sistema

fprintf('\n----------------------------------\n\n')
fprintf('Soluzione sistema\n')
Y = SostituzioneAvanti(L, b)'

Am = [L' Y];
X = SostituzioneIndietro(Am)'

fprintf('Confronta il risultato qui sotto con il vettore b\n');
A*X