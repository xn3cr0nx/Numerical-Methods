% f2: funzione inline, derivata seconda di f
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% n: numero di sottointervalli
% xi: valore di xi che rende massimo l'errore

function errore = ErroreTrapezioComposto(f2, a, b, n, xi)
  h = (b-a)/n;
  
  errore = abs(f2(xi)*(b-a)*(h^2)/12);
  fprintf('Errore massimo Trapezio Composto\n');
  fprintf('Graficando la f2 nell intervallo [%d,%d], trovo che il max è xi=%d, quindi\n', a, b, xi);
  fprintf('errore_max = |f2(xi)*(b-a)*(h^2)/12|\n');
  fprintf('= |f2(%d)*(%d - %d)*(%d ^2)/12|\n', xi, b, a, h);
  fprintf('= |%d * %d * %d / 12|\n', f2(xi), b-a, h^2);
  fprintf('= %i\n', errore);
end