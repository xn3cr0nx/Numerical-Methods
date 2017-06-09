% A: matrice da ridurre a scala, in esercitazione6 è intesa come la
%    matrice aumentata Am = [A b]

function A = RiduzioneGauss(A)
  n = length(A(:,1));
  for i=1:n
    A
    A = CercaPivot(A, i);
    if A(i,i) == 0
      fprintf('Errore, il pivot %d è 0.\n', i)
      return
    end
    
    for j=i+1:n
      fprintf('Riga %i, coefficiente: A(%i,%i)/A(%i,%i)=%i\n', j, j, i, i, i, A(j,i)/A(i,i));
      coeff = A(j,i)/A(i,i);
        for k=i:n
          fprintf('Colonna %i\n', k);
          fprintf('A(%i,%i) = A(%i,%i) - coeff*A(%i,%i) = %i - %i*%i = %i =', j, k, j, k, i, k, A(j,k), coeff, A(i,k));
          A(j,k) = A(j,k) - coeff*A(i,k);
          fprintf('%i\n', A(j,k));
        end
    end
  end
end

%       fprintf('A(%i,:) = A(%i,:) - (A(%i,%i)/A(%i,%i))*A(%i,:) = %i - (%i/%i))*%i\n', j, j, j, i, i, i, i, A(j,:), A(j,i), A(i,i), A(i,:));
%       A(j,:) = A(j,:) - (A(j,i)/A(i,i))*A(i,:);