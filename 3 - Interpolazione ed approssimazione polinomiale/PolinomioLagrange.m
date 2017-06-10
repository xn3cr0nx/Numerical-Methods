% x_points: array con i punti x
% y_points: array con i punti f(x) (ovviamente f non la si conosce)
% P: polinomio di Lagrange

function P = PolinomioLagrange(x_points, y_points, f)
  fprintf('\n----------------------------------\n\n')
  fprintf('Metodo dei Polinomi elementari\n\n')
  n = length(x_points);
  syms x;
  P = 0; % polinomio
  
  for i=1:n
    
    % Calcolo L(n, k)
    Lnum = 1; % numeratore
    Lden = 1; % denominatore
    
    %Alcune operazioni di stampa
    fprintf('L%i,%i = ', n-1, i-1);
    for j=1:n
      if j ~= i
        fprintf('(x - x%d)/(x%d - x%d)', j-1, i-1, j-1);
        if j ~= n
          fprintf(' * ');
        end
      end
    end
    fprintf('\n     = %s');
    
    % Calcolo i polinomi e li stampo
    for j=1:n
      if j ~= i
        Lnum = Lnum * (x - x_points(j));
        Lden = Lden * (x_points(i) - x_points(j));
        fprintf('(x - %d)/(%d - %d) * ', x_points(j), x_points(i), x_points(j));
      end
    end
    L = Lnum / Lden;
    
    fprintf('\n     = %s\n', L);
    
    P = P + y_points(i)*L;
  end
  
  % Il polinomio diventa della forma x^n + x^n-1 + ... + x0
  if n ~= 1
    P = expand(P);

    fprintf('\nP%d = ', j-1);
     % Qui stampo i simboli
    for i=1:n
      fprintf('f(x%d)*L%i,%i', i-1, j-1, i-1);
      if i ~= n
        fprintf(' + ');
      end
    end
    fprintf('\n   = ');
    % Qui stampo i valori in forma parametrica
    for i=1:n
      fprintf('f(%d)*L%i,%i', x_points(i), j-1, i-1);
      if i ~= n
        fprintf(' + ');
      end
    end
    % Qui sostituisco i valori numerici ai parametri
    fprintf('\n   = ');
    for i=1:n
      fprintf('%d*L%i,%i', f(x_points(i)), j-1, i-1);
      if i ~= n
        fprintf(' + ');
      end
    end
    
    
    fprintf('\n');
    format long
    % Stampa i coefficienti, [x(n) x(n-1) ... x(1) x(0)]
    coefficienti = double(fliplr(coeffs(P)));
  end
    
    fprintf('Forma canonica P%i = %s\n', length(x_points)-1, P);
end
