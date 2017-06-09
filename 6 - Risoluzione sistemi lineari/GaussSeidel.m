% A: matrice del sistema A*X = b
% b: vettore dei termini noti del sistema A*X = b
% T: matrice T dell'equazione X = T*X + c, estratta con Gauss-Siedel
% c: vettore c dell'equazione X = T*X + c, estratto con Gauss-Siedel

function [T, c] = GaussSeidel(A, b)
  n = length(A);
  D = eye(n);
  L = zeros(n);
  U = zeros(n);
  for i=1:n
    D(i,i) = A(i,i);
    for j=i+1:n
      L(j,i) = -A(j,i);
      U(i,j) = -A(i,j);
    end
  end
  
  T = inv(D-L)*U;
  c = inv(D-L)*b;
end