% A: matrice del sistema A*X = b
% b: vettore dei termini noti del sistema A*X = b
% T: matrice T dell'equazione X = T*X + c, estratta con Jacobi
% c: vettore c dell'equazione X = T*X + c, estratto con Jacobi

function [T, c] = Jacobi(A, b)
  disp('Costruzione T e c con Metodo di Jacobi')
  n = length(A);
  D = eye(n);
  L = zeros(n);
  U = zeros(n);
  for i=1:n
    fprintf('Iterazione %i\n', i);
    D(i,i) = A(i,i);
    fprintf('D(%i,%i) = A(%i,%i) = %i\n', i, i, i, i, A(i,i));
    for j=i+1:n
      L(j,i) = -A(j,i);
      fprintf('L(%i,%i) = -A(%i,%i) = %i\n', j, i, j, i, -A(j,i));
      U(i,j) = -A(i,j);
      fprintf('U(%i,%i) = -A(%i,%i) = %i\n', i, j, i, j, -A(i,j));
    end
  end
  
  T = inv(D)*(L+U);
  fprintf('\nT = inv(D)*(L+U) = ')
  invD = inv(D)
  disp('*')
  L
  disp('+')
  U
  disp('=')
  T
  c = inv(D)*b;
  fprintf('\nc = inv(D)*b = ')
  invD
  disp('*')
  b
  disp('=')
  c
end