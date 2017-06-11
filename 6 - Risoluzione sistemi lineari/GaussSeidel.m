% A: matrice del sistema A*X = b
% b: vettore dei termini noti del sistema A*X = b
% T: matrice T dell'equazione X = T*X + c, estratta con Gauss-Siedel
% c: vettore c dell'equazione X = T*X + c, estratto con Gauss-Siedel

function [T, c] = GaussSeidel(A, b)
  disp('Costruzione T e c con Metodo di Gauss Seidel')
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
  
  fprintf('Scriviamo la matrice A come A = D - L - U\n');
  A
  D
  L
  U
  
  
  fprintf('Otteniamo quindi "(D - L - U)*x = b", da cui => "(D-L)*x = U*x + b"\n');
  fprintf('E infine => "x = inv(D-L)*U*x + inv(D-L)*b"\n');
  fprintf('Definiamo T = "inv(D-L)*U",\t c = "inv(D-L)*b"\n');
  fprintf('Quindi otteniamo "x = T*x + c"\n');
  
  
  T = inv(D-L)*U;
  fprintf('\nT = inv(D-L)*U = ')
  D
  disp('-')
  L
  disp('=')
  DL = D-L
  disp('=>')
  invDL = inv(DL)
  disp('*')
  U
  disp('=')
  T
  c = inv(D-L)*b;
  fprintf('\nc = inv(D-L)*b = ')
  invDL
  disp('*')
  b
  disp('=')
  c
end