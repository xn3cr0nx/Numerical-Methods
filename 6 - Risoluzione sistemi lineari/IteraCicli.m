% T: matrice T dell'equazione X = T*X + c
% c: vettore c dell'equazione X = T*X + c
% X: vettore delle incognite del sistema A*X = b
% numero_cicli: numero di iterazioni da eseguire sul vettore X

function X = IteraCicli(T, c, X, numero_cicli)
  % Raggio spettrale, per avere convergenza deve essere minore di 1
  rho = max(abs(eig(T)));
  if rho >= 1
    fprintf('Attenzione, raggio spettrale maggiore di 1, non c è convergenza.\n')
  end
  for i=1:numero_cicli
    X_old = X;
    X = T*X + c;
    % Se ti serve calcolare l'errore in ogni iterazione, scommenta sotto
    errore_dal_precente = norm(X-X_old)
    soluzione = [1 2 -1]'; % vettore colonna
    errore = norm(X - soluzione) % 'norm' è la norma euclidea
  end
end