clear
clc

A = [5 2.50 0 0;
     3.5 -8 4 0;
     0 2.5 10 5;
     0 0 10 -20];
b = [3.5 7.7 -5 -22.5]';


[L, U] = Crout(A)

fprintf('\n----------------------------------\n\n')
fprintf('Soluzione sistema\n')
Y = SostituzioneAvanti(L, b)'

Am = [U Y];
X = SostituzioneIndietro(Am)'

fprintf('Confronta il risultato qui sotto con il vettore b\n');
A*X