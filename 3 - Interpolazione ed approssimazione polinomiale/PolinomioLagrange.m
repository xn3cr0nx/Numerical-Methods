% x_points: array con i punti x
% y_points: array con i punti f(x) (ovviamente f non la si conosce)
% P: polinomio di Lagrange

function P = PolinomioLagrange(x_points, y_points)
  disp('Metodo dei Polinomi elementari')
  n = length(x_points);
  syms x;
  P = 0; % polinomio
  
  for i=1:n
    
    % Calcolo L(n, k)
    Lnum = 1; % numeratore
    Lden = 1; % denominatore
    for j=1:n
      if j ~= i
        Lnum = Lnum * (x - x_points(j));
        Lden = Lden * (x_points(i) - x_points(j));
      end
    end
    L = Lnum / Lden;
    fprintf('L%i,%i: %s\n', j-1, i-1, L);
    P = P + y_points(i)*L;
  end
  
  % Il polinomio diventa della forma x^n + x^n-1 + ... + x0
  if n ~= 1
    P = expand(P);
 
    fprintf('Qui svolgere P%i(x)\n', j-1);
    format long
    % Stampa i coefficienti, [x(n) x(n-1) ... x(1) x(0)]
    coefficienti = double(fliplr(coeffs(P)));
    
  end
  fprintf('Forma canonica P%i = %s', length(x_points)-1, P); 
end