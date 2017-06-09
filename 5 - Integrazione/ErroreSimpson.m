% f4: funzione inline, derivata quarta di f
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% xi: valore di xi che rende massimo l'errore

function errore = ErroreSimpson(f4, a, b, xi)
  h = (b - a)/2;
  errore = abs((f4(xi)/90)*h^5);
  disp('ricordarsi di plottare per trovare il max della funzione')
  fprintf('Errore Simpson: (f4(%i)/90)*%i^5 = %i\n', xi, h, errore);
end