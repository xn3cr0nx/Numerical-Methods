% A: matrice del sistema A*X = b
% L: matrice L di A, estratta con la riduzione di Gauss
% U: matrice U di A, estratta con la riduzione di Gauss

function [L, U] = FattorizzazioneLU(A)
  disp('Ricordarsi che l incremento della colonna k è k=1:n+1 per la matrice completa, qui k=1:n, modificare')
  disp('Costruzione U')
  U = RiduzioneGauss(A);
  U
  n = length(U);
  L = eye(n);
  disp('Costruzione L')
  for i=1:n
    for j=i:n
      sommatoria = 0;

      for k=1:i-1
        fprintf('\nsomm(L(%i,%i)*U(%i,%i)) = ', j, k, k, i)
        disp('+')
        sommatoria = sommatoria + L(j,k)*U(k,i);
        fprintf('L(%i,%i)*U(%i,%i) = %i*%i = %i\n', j, k, k, i, L(j,k), U(k,i), L(j,k)*U(k,i))
      end
      fprintf('L(%i,%i) = (A(%i,%i) - somm(L(%i,k)*U(%i,k)))/U(%i,%i) = (%i - %i)/%i = ', j, i, j, i, j, i, i, i, A(j,i), sommatoria, U(i,i))
      L(j,i) = (A(j,i) - sommatoria)/U(i,i);
      fprintf('%i\n', L(j,i));
    end
  end
  L
end