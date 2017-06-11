% f: è una inline function, esempio "f = inline('x^2+1')"
% a, b: estremi dell'intervallo iniziale
% n_max: massimo numero di iterazioni
% TOL: tolleranza, ci si ferma se abs(b-a)/2 < TOL

function p = bisezione(f, a, b, n_max, TOL)
%pe = 1.365230013; % SE SERVE INSERISCI IL VALORE ESATTO, SCOMMENTA RIGA 29
pp = 0;
fprintf('Max numero di iterazioni: %i\n', log2((b-a)/TOL));
  % Parametri di default, Matlab non li gestisce..
  if nargin < 5
    TOL = 0.001;
  end
  if nargin < 4
    n_max = 100;
  end

  EPS = 10^-12;
  
  if sign(f(a))*sign(f(b)) >= 0
    fprintf('Errore agli estremi\n')
    p = a;
  else
    for i=1:n_max
      p = a + (b-a)/2;
      fprintf('\nCiclo %i\na: %f b: %f,\np: %f, f(p): %f\n', i, a, b, p, f(p));
      fprintf('Differenza precedente: %f\n', abs(p-pp));
      fprintf('Errore di approssimazione: %f\n', abs(b-a)/2);
      %fprintf('Errore assoluto: %i, Errore relativo: %f\n', abs(pe-p), abs(pe-p)/pe);
      % Verifico se posso fermarmi
      if abs(f(p)) < EPS % f(p) = 0, ma sul computer è difficile avere 0
        fprintf('\n----------------------------------\n\n')
        fprintf('Risultato esatto: %f\n', p)
        break
      elseif abs(b-a)/2 < TOL
        fprintf('\n----------------------------------\n\n')
        fprintf('Risultato sotto TOL: %f\n', p)
        break
      end
      pp = p;
      % Assegno nuovo intervallo
      if sign(f(p))*sign(f(a)) < 0
        b = p;
      else
        a = p;
      end
    end
    if i == n_max
      fprintf('\nNumero massimo di iterazioni raggiunto.\nControllare il risultato\n')
    else
      fprintf('Iterazioni: %d\n', i)
    end
  end
end