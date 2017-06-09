% x_points: array con i punti x
% y_points: array con i punti f(x) (ovviamente f non la si conosce)
% D: matrice con le differenze divise. Nella prima riga ci sono n termini
%    di ordine 0, nella seconda riga ci sono n-1 termini di ordine 1,
%    e così via fino all'ultima riga in cui c'è solo un termine di ordine n
%    I valori da usare per il polinomio sono quelli della prima colonna

function D = DiffDivise(x_points, y_points)
  n = length(x_points);
  D = zeros(n);
  disp('Metodo delle differenze divise')
  % Inizializzo la prima riga
  for k=1:n
    D(k, 1) = y_points(k);
  end
    
  % Riempio le altre righe
  % Occhio agli indici, Matlab parte da 1 quindi ho dovuto adattarli tutti
  for i=2:n
    for j=i:n
      fprintf('f[x%i...x%i] = ', j-i, j-1);
      D(j, i) = (D(j, i-1) - D(j-1, i-1)) / (x_points(j) - x_points(j-i+1));
      fprintf('%s\n', sym(D(j, i)));
    end
  end
  fprintf('Tabelle delle differenze divise:');
  sym(D)
end