% x: è il valore in cui si è calcolato il valore della funzione
% f_derivata: è la funzione inline della derivata

function errore = ErroreLagrange(grado_derivata, max_derivata, f_derivata, x, x_points)

  n = length(x_points);
  prodotto_binomi = 1;

  fprintf('Errore massimo teorico = |f%d(xi)/%d! ', grado_derivata, grado_derivata);
  for i=1:n
    fprintf('* (x - x%d) ', i-1);
  end
  fprintf('|\n = |f%d(%d)/%d ', grado_derivata, max_derivata, factorial(grado_derivata));
  for i=1:n
    fprintf('* (%d - %d) ', x, x_points(i));
  end
  
  for i=1:n
    prodotto_binomi = prodotto_binomi * (x - x_points(i));
  end
  fprintf('|\n = |%d/%d*%d', f_derivata(max_derivata), factorial(grado_derivata), prodotto_binomi)
  fprintf('|\n = |%d*%d', f_derivata(max_derivata)/factorial(grado_derivata), prodotto_binomi)
  errore = abs((f_derivata(max_derivata)/factorial(grado_derivata))*prodotto_binomi);
  fprintf('|\n =\t %d', errore);
end