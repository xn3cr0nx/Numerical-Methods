% L: matrice L di A, lower
% b: vettore dei termini noti del sistema A*X = b

function Y = SostituzioneAvanti(L, b)
  n = length(L);
  for i=1:n
    sommatoria = 0;
    for j=1:i-1
      sommatoria = sommatoria + L(i,j)*Y(j);
    end
    Y(i) = (b(i) - sommatoria)/L(i,i);
  end
end