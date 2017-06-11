% f: è una inline function, esempio "f = inline('x^2+1')"
% p1: valore di partenza
% n_max: massimo numero di iterazioni
% TOL: tolleranza, ci si ferma se abs(b-a)/2 < TOL
% h: incremento della derivata

function p = Newton(f, p0, n_max, TOL, h)
  % Parametri di default, Matlab non li gestisce..
  if nargin < 5
    h = 10^-6;
  end
  if nargin < 4
    TOL = 0.001;
  end
  if nargin < 3
    n_max = 100;
  end
  
  EPS = 10^-12;
  
  for i=1:n_max
    slope = Slope(f, p0, h);
    if slope == 0
      % Bisogna fermarsi, perchè sotto si divide per 'slope'
      fprintf('Derivata nulla, arresto della procedura.\n');
      break;
    else
      p = p0 - f(p0)/slope;
      fprintf('\nCiclo %i\n', i);
      fprintf('p: %f, p+1: %f\n', p0, p);
      fprintf('f(p): %f, f`(p): %f\n', f(p), slope);
      fprintf('Differenza precedente: %f\n', abs(p-p0));
      if abs(f(p)) < EPS % f(p) = 0, ma sul computer è difficile avere 0
        fprintf('\n----------------------------------\n\n')
        fprintf('Risultato esatto: %f\n', p)
        break
      end
      if abs(p - p0) < TOL
        fprintf('\n----------------------------------\n\n')
        fprintf('Risultato sotto TOL: %f\n', p)
        break
      end
      p0 = p;
    end 
  end
  if i == n_max
    fprintf('\nNumero massimo di iterazioni raggiunto.\nControllare il risultato\n')
  else
    fprintf('Iterazioni: %d\n', i)
  end
  
end