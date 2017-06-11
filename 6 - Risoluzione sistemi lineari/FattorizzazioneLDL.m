% A: matrice del sistema A*X = b
% L: matrice L di A, estratta con la fattorizzazione LDL
% D: matrice D di A, estratta con la fattorizzazione LDL

function [L ,D] = FattorizzazioneLDL(A)
  n = length(A);
  L = eye(n);
  D = eye(n);
  
  disp('Costruzione D e L con Fattorizzazione LDL')
  for i=1:n
    sommatoria = 0;
    fprintf('\nsomm(L(%i,j)^2*D(j,j)) = 0\n', i)
    for j=1:i-1
      disp('+')
      sommatoria = sommatoria + L(i,j)^2*D(j,j);
      fprintf('L(%i,%i)^2*D(%i,%i) = %i\n', i, j, j, j, L(i,j)^2*D(j,j));
    end
    D(i,i) = A(i,i) - sommatoria;
    fprintf('D(%i,%i) = A(%i,%i) - somm(L(%i,j)^2*D(j,j)) = %i - %i\n', i, i, i, i, i, A(i,i), sommatoria);
    
    disp(' ')
    disp(' ')
    for j=i:n
      sommatoria = 0;
      fprintf('\nsomm(L(%i,k)*L(%i,k)*D(k,k)) = 0\n', j, i)
      for k=1:i-1
        disp('+')
        sommatoria = sommatoria + L(j,k)*L(i,k)*D(k,k);
        fprintf('L(%i,%i)*L(%i,%i)*D(%i,%i) = %i\n', j, k, i, k, k, k, L(j,k)*L(i,k)*D(k,k));
      end
      L(j,i) = (A(j,i) - sommatoria)/D(i,i);
      fprintf('L(%i, %i) = (A(%i, %i) - somm(L(%i,k)*L(%i,k)*D(k,k)))/D(%i, %i) = (%i - %i)/%i = %i\n', j, i, j, i, j, i, i, i, A(j,i), sommatoria, D(i,i), (A(j,i) - sommatoria)/D(i,i));
    end
  end
end