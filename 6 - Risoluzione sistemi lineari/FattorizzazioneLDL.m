% A: matrice del sistema A*X = b
% L: matrice L di A, estratta con la fattorizzazione LDL
% D: matrice D di A, estratta con la fattorizzazione LDL

function [L ,D] = FattorizzazioneLDL(A)
  n = length(A);
  L = eye(n);
  D = eye(n);
  for i=1:n
    sommatoria = 0;
    for j=1:i-1
      sommatoria = sommatoria + L(i,j)^2*D(j,j);
    end
    D(i,i) = A(i,i) - sommatoria;
    
    for j=i:n
      sommatoria = 0;
      for k=1:i-1
        sommatoria = sommatoria + L(j,k)*L(i,k)*D(k,k);
      end
      L(j,i) = (A(j,i) - sommatoria)/D(i,i);
    end
  end
end