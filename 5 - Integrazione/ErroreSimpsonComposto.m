% f4: funzione inline, derivata quarta di f
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% n: numero di sottointervalli
% xi: valore di xi che rende massimo l'errore

function errore = ErroreSimpsonComposto(f4, a, b, n, xi)
  h = (b-a)/n;
  
  errore = abs(f4(xi)*(b-a)*(h^4)/180);
  fprintf('Errore massimo Simpson Composto\n');
  fprintf('Graficando la f4 nell intervallo [%d,%d], trovo che il max è xi=%d, quindi\n', a, b, xi);
  fprintf('errore_max = |f4(xi)*(b-a)*(h^4)/180|\n');
  fprintf('= |f4(%d)*(%d - %d)*(%d ^4)/180|\n', xi, b, a, h);
  fprintf('= |%d * %d * %d / 180|\n', f4(xi), b-a, h^4);
  fprintf('= %i\n', errore);
end