% x_points: array con i punti x
% y_points: array con i punti f(x) (ovviamente f non la si conosce)
% D: matrice con le differenze divise. Nella prima riga ci sono n termini
%    di ordine 0, nella seconda riga ci sono n-1 termini di ordine 1,
%    e così via fino all'ultima riga in cui c'è solo un termine di ordine n
%    I valori da usare per il polinomio sono quelli della prima colonna

function D = DiffDivise(x_points, y_points)
  n = length(x_points);
  D = zeros(n);
  fprintf('\n----------------------------------\n\n')
  fprintf('Metodo delle differenze divise\n\n')
  % Inizializzo la prima colonna
  fprintf('Colonna 1\n');
  for k=1:n
    D(k, 1) = y_points(k);
    fprintf('f[x%d] = f(%d) = %d\n', k-1, x_points(k), y_points(k));
  end
  
  
  % Riempio le altre colonne
  
  for i=2:n
    fprintf('\nColonna %d\n', i);
    for j=i:n
      D(j, i) = (D(j, i-1) - D(j-1, i-1)) / (x_points(j) - x_points(j-i+1));
      fprintf('f[x%i...x%i] = ', j-i, j-1);
      fprintf('(f[x%i...x%i] - f[x%i...x%i])/(x%d - x%d)', j-i+1, j-1, j-i, j-2, j-1, j-i);
      fprintf('\n           = (%d - %d)/(%d - %d) = ', D(j, i-1), D(j-1, i-1), x_points(j), x_points(j-i+1));
      fprintf('%s\n', sym(D(j, i)));
    end
  end
  fprintf('\nTabelle delle differenze divise:');
  sym(D)
end