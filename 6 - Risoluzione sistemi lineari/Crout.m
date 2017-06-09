% A: matrice del sistema A*X = b
% L: matrice L di A, estratta con l'algoritmo di Crout
% U: matrice U di A, estratta con l'algoritmo di Crout

function [L, U] = Crout(A)
  n = length(A);
  L = eye(n);
  U = eye(n);
  L(1,1) = A(1,1);
  U(1,2) = A(1,2)/L(1,1);
  for i=2:n-1
    L(i,i-1) = A(i, i-1);
    L(i,i) = A(i,i) - L(i,i-1)*U(i-1,i);
    U(i,i+1) = A(i,i+1)/L(i,i);
  end
  L(n, n-1) = A(n, n-1);
  L(n,n) = A(n,n) - L(n, n-1)*U(n-1,n);
end