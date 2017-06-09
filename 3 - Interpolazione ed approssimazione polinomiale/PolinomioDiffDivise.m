% D: matrice delle differenze divise, risultato di DiffDivise.m
% x_points: array con i punti x
% grado: grado del polinomio risultante
% P: polinomio ricercato

function P = PolinomioDiffDivise(D, x_points, grado)
  syms x;
  P = 0; % polinomio

  for k=1:grado+1

    % Calcolo i binomi (x-x0)(x-x1) ecc.
    binomi = 1;
    for j=2:k
      binomi = binomi * (x - x_points(j-1));
    end

    P = P + D(k,k)*binomi;
  end
  
  % Il polinomio diventa della forma x^n + x^n-1 + ... + x0
  if grado ~= 0
    P = expand(P);
    
    format long
    % Stampa i coefficienti, [x(n) x(n-1) ... x(1) x(0)]
    coefficienti = double(fliplr(coeffs(P)));
    
  end
end