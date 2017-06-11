% T: matrice T dell'equazione X = T*X + c
% c: vettore c dell'equazione X = T*X + c
% X: vettore delle incognite del sistema A*X = b
% numero_cicli: numero di iterazioni da eseguire sul vettore X
% soluzione_esatta: vettore COLONNA della soluzione

function X = IteraCicli(T, c, X, numero_cicli, soluzione_esatta)
  fprintf('\n----------------------------------\n\n');
  fprintf('Soluzione iterativa del sistema\n\n');
  % Raggio spettrale, per avere convergenza deve essere minore di 1
  rho = max(abs(eig(T)));
  if rho >= 1
    fprintf('Attenzione, raggio spettrale maggiore di 1, non c è convergenza.\n')
  end
  for i=1:numero_cicli
    fprintf('Iterazione: %d\n', i);
    X_old = X;
    X = T*X + c;
    
    fprintf('X = T*X_old + c');
    X
    differenza_dal_precedente = X-X_old
    differenza_dalla_soluzione = X-soluzione_esatta
    errore_dal_precedente = norm(X-X_old)
    errore_dalla_soluzione = norm(X - soluzione_esatta) % 'norm' è la norma euclidea
    fprintf('----------------------------------\n');
  end
end