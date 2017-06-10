% D: matrice delle differenze divise, risultato di DiffDivise.m
% x_points: array con i punti x
% P: polinomio ricercato

function P = PolinomioDiffDivise(D, x_points)
  syms x;
  P = D(1,1); % polinomio
  n = length(x_points);
  fprintf('Polinomio differenze divise\n');
  fprintf('P(x) = f[x0]');
  for i=2:n
    fprintf(' + f[x0...x%i]', i-1);
    for j=1:(i-1)
      fprintf('*(x - x%d)', j-1);
    end
  end
  fprintf('\n     = %d', D(1,1));
  
  for k=2:n

    fprintf(' + %d', D(k,k));
    % Calcolo i binomi (x-x0)(x-x1) ecc.
    binomi = 1;
    for j=2:k
      binomi = binomi * (x - x_points(j-1));
    end

    fprintf('*%s', binomi);
    P = P + D(k,k)*binomi;
  end
  
  fprintf('\n     = %s', P);
  
  % Il polinomio diventa della forma x^n + x^n-1 + ... + x0
  if n ~= 1
    P = expand(P);
    fprintf('\n     = %s\n', P);
     
    format long
    % Stampa i coefficienti, [x(n) x(n-1) ... x(1) x(0)]
    coefficienti = double(fliplr(coeffs(P)));
    
  end
end