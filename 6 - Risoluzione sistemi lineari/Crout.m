% A: matrice del sistema A*X = b
% L: matrice L di A, estratta con l'algoritmo di Crout
% U: matrice U di A, estratta con l'algoritmo di Crout

function [L, U] = Crout(A)
  n = length(A);
  L = eye(n);
  U = eye(n);
  L(1,1) = A(1,1);
  disp('Costruzione L e U con Metodo di Crout')
  fprintf('L(1,1) = A(1,1) = %i\n', A(1,1));
  U(1,2) = A(1,2)/L(1,1);
  fprintf('U(1,2) = A(1,2)/L(1,1) = %i/%i, %i\n', A(1,2), L(1,1), A(1,2)/L(1,1));
  for i=2:n-1
    L(i,i-1) = A(i, i-1);
    fprintf('L(%i,%i) = A(%i,%i) = %i/n', i, i-1, i, i-1, A(i, i-1));
    L(i,i) = A(i,i) - L(i,i-1)*U(i-1,i);
    fprintf('L(%i,%i) = A(%i,%i) - L(%i,%i)*U(%i,%i) = %i - %i*%i = %i\n', i, i, i, i, i, i-1, i-1, i, A(i,i), L(i,i-1), U(i-1,i), A(i,i) - L(i,i-1)*U(i-1,i));
    U(i,i+1) = A(i,i+1)/L(i,i);
    fprintf('U(%i,%i) = A(%i,%i)/L(%i,%i) = %i/%i = %i\n', i, i+1, i, i+1, i, i, A(i,i+1), L(i,i), A(i,i+1)/L(i,i));
  end
  L(n, n-1) = A(n, n-1);
  fprintf('L(%i, %i) = A(%i, %i) = %i\n', n, n-1, n, n-1, A(n, n-1));
  L(n,n) = A(n,n) - L(n, n-1)*U(n-1,n);
  fprintf('L(%i,%i) = A(%i,%i) - L(%i, %i)*U(%i,%i) = %i - %i*%i = %i\n', n, n, n, n, n, n-1, n-1, n, A(n,n), L(n, n-1), U(n-1,n), A(n,n) - L(n, n-1)*U(n-1,n));
end