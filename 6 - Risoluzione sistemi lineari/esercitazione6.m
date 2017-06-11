%% ESERCIZIO 1
clear all
clc

A = [1 -1 2 -1; 2 -2 3 -3; 1 1 1 0; 1 -1 4 3];
b = [-8 -20 -2 4]';

Am = [A b];
Am = RiduzioneGauss(Am)

X = SostituzioneIndietro(Am)'

A*X

%% ESERCIZIO 3
clear all
clc


A = [1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -1 2 3 -1];
b = [8 7 14 -7]';

[L, U] = FattorizzazioneLU(A);

Y = SostituzioneAvanti(L, b)'

Am = [U Y];
X = SostituzioneIndietro(Am)'

A*X

%% ESERCIZIO 4
clear all
clc

A = [1 -2 3 0; 2 1 4 1; 1 -2 2 -2; 3 -6 9 3];
b1 = [1 2 3 0]';
b2 = [2 0 1 3]';

[L, U] = FattorizzazioneLU(A)

% b1
Y = SostituzioneAvanti(L, b1)'

Am = [U Y];
X = SostituzioneIndietro(Am)'

A*X
% b2
Y = SostituzioneAvanti(L, b2)'

Am = [U Y];
X = SostituzioneIndietro(Am)'

A*X


%% ESERCIZIO 5
clear all
clc

A = [4 -1 1; -1 4.25 2.75; 1 2.75 3.5];
b = [1 5 8]';

L = Cholesky(A)
%L*L' == A
Y = SostituzioneAvanti(L, b)'

Am = [L' Y];
X = SostituzioneIndietro(Am)'

A*X


[L, D] = FattorizzazioneLDL(A)
%L*D*L' == A

Y = SostituzioneAvanti(L, b)'

% Costruisco Z
for i=1:length(Y)
  Z(i,1) = Y(i)/D(i,i);
end
Z

Am = [L' Z];
X = SostituzioneIndietro(Am)';

A*X

%% ESERCIZIO 6
clear all
clc

A = [3 1 0; 2 4 1; 0 2 5];
b = [-1 7 9]';


[L, U] = Crout(A)

Y = SostituzioneAvanti(L, b)';

Am = [U Y];
X = SostituzioneIndietro(Am)';

A*X


%% ESERCIZIO 7

% Note: nelle funzioni IteraCicli e IteraTolleranza sono presenti anche i
% calcoli dell'errore rispetto alla soluzione esatta e la differenza
% relativa rispetto all'iterazione precedente. Di default sono commentati,
% quindi se servono bisogna scommentarli IN MODO OPPORTUNO.
% Inoltre viene anche considerato il raggio spettrale per valutare la
% convergenza.

clear all
clc

A = [2 -1 1; 2 2 2; -1 -1 2];
b = [-1 4 -5]';
soluzione = [1 2 -1]';

% Jacobi
[T, c] = Jacobi(A, b);

X = zeros(length(c), 1); % vettore colonna di zeri

num_iterazioni= 4;
X = IteraCicli(T, c, X, num_iterazioni)

% Gauss-Seidel
[T, c] = GaussSeidel(A, b);

X = zeros(length(c), 1);

num_iterazioni = 4;
X = IteraCicli(T, c, X, num_iterazioni)
%X = IteraTolleranza(T, c, X, 10^-3)











