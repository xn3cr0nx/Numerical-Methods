% Am: matrice aumentata Am = [A b]. Potrebbe anche essere Am = [U Y] se è
%     stata applicata la fattorizazzione LU.
% X: vettore soluzione dell'equazione A*X = b

function X = SostituzioneIndietro(Am)
  n = length(Am) -1;
  for i=n:-1:1
    sommatoria = 0;
    for j=i+1:n
      sommatoria = sommatoria + Am(i,j)*X(j);
    end
    X(i) = (Am(i,n+1) - sommatoria)/Am(i,i);
  end
end