% A: matrice del sistema A*X = b
% L: matrice L di A, estratta col metodo di Cholesky

function L = Cholesky(A)
  disp('Costruzione L con Cholesky')
  n = length(A);
  L = eye(n);
  L(1,1) = sqrt(A(1,1));
  fprintf('L(1,1) = sqrt(A(1,1)) = %i\n', sqrt(A(1,1)));
  for j=2:n
    L(j,1) = A(j,1)/L(1,1);
    fprintf('L(%i,1) = A(%i,1)/L(1,1) = %i\n', j, j, A(j,1)/L(1,1));
  end
  
  for i=1:n-1
    sommatoria = 0;
    fprintf('\nsomm(L(%i,k)^2) = 0\n', i);
    for k=1:i-1
      disp('+')
      sommatoria = sommatoria + L(i,k)^2;
      fprintf('L(%i,%i)^2 = %i\n', i, k, L(i,k)^2)
    end
    L(i,i) = sqrt(A(i,i) - sommatoria);
    fprintf('L(%i,%i) = sqrt(A(%i,%i) - somm(L(%i,k)^2) = %i - %i = %i\n', i, i, i, i, i, sqrt(A(i,i)), sommatoria, sqrt(A(i,i)) - sommatoria);
    
    for j=i+1:n
      sommatoria = 0;
      fprintf('\nsomm(L(%i,k)*L(%i,k)) = 0\n', j, i);
      for k=1:i-1
        disp('+')
        sommatoria = sommatoria + L(j,k)*L(i,k);
        fprintf('L(%i,%i)*L(%i,%i) = %i\n', j, k, i, k, L(j,k)*L(i,k))
      end
      L(j,i) = (A(j,i)-sommatoria)/L(i,i);
      fprintf('L(%i,%i) = (sqrt(A(%i,%i) - somm(L(%i,k)*L(%i,k))/L(%i,%i)) = (%i - %i)/%i = %i\n', j, i, j, i, j, i, i, i, sqrt(A(j,i)), sommatoria, L(i,i), (sqrt(A(j,i)) - sommatoria)/L(i,i));
    end
  end
end