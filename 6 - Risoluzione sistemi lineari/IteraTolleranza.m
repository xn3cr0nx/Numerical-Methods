% T: matrice T dell'equazione X = T*X + c
% c: vettore c dell'equazione X = T*X + c
% X: vettore delle incognite del sistema A*X = b
% tolleranza: valore di tolleranza che arresta l'algoritmo, la tolleranza è
% intesa rispetto al valore 'norm(X - X_old)'

function X = IteraTolleranza(T, c, X, tolleranza)
  % Raggio spettrale, per avere convergenza deve essere minore di 1
  rho = max(abs(eig(T)));
  if rho >= 1
    fprintf('Errore, raggio spettrale maggiore di 1, non c è convergenza.\n')
    return
  end
  X_old = 0;
  while ((length(X_old) == 1) || (norm(X-X_old) > tolleranza))
    X_old = X;
    X = T*X + c;
    % Se ti serve calcolare l'errore in ogni iterazione, scommenta sotto
    errore_dal_precente = norm(X-X_old)
    soluzione = [1 2 -1]'; % vettore colonna
    errore = norm(X - soluzione) % 'norm' è la norma euclidea
  end
end