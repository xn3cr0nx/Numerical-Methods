clear
clc

A = [1.19 2.11 -100 1;
     14.2 -0.122 12.2 -1;
     0 100 -99.9 1;
     15.3 0.110 -13.1 -1];


[L, U] = FattorizzazioneLU(A);

fprintf('\nVerifica che la fattorizzazione sia corretta, confronta A con questo risultato:');
L*U

%% Inserimento vettori termini noti

% Ricordati l'apice alla fine della matrice, l'apice fa la trasposta
b1 = [2.15 -3.44 1.12 4.16]';
b2 = [1.12 3.44 2.15 4.16]';
b3 = [1 1 1 1]';
b4 = [1 3.5 2 4]';

% Inserire in B solo i vettori 'b' necessari (esempio: B = [b1];)
B = [b1 b2 b3 b4];

%%

for i=1:size(B,2)
  
  fprintf('\n----------------------------------\n\n')
  fprintf('Sistema: %d\n', i);
  Y = SostituzioneAvanti(L, B(:,i))'

  Am = [U Y];
  X = SostituzioneIndietro(Am)'

  fprintf('Confronta il risultato qui sotto con il vettore b%d\n', i);
  A*X
end
