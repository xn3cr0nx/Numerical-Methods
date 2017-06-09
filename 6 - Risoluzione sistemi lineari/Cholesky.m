% A: matrice del sistema A*X = b
% L: matrice L di A, estratta col metodo di Cholesky

function L = Cholesky(A)
  n = length(A);
  L = eye(n);
  L(1,1) = sqrt(A(1,1));
  for j=2:n
    L(j,1) = A(j,1)/L(1,1);
  end
  
  for i=1:n-1
    sommatoria = 0;
    for k=1:i-1
      sommatoria = sommatoria + L(i,k)^2;
    end
    L(i,i) = sqrt(A(i,i) - sommatoria);
    
    
    for j=i+1:n
      sommatoria = 0;
      for k=1:i-1
        sommatoria = sommatoria + L(j,k)*L(i,k);
      end
      L(j,i) = (A(j,i)-sommatoria)/L(i,i);
    end
  end
end