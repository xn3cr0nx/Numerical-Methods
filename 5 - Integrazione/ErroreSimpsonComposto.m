% f4: funzione inline, derivata quarta di f
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% n: numero di sottointervalli
% xi: valore di xi che rende massimo l'errore

function errore = ErroreSimpsonComposto(f4, a, b, n, xi)
  h = (b-a)/n;
  
  errore = f4(xi)*(b-a)*(h^4)/180;
  fprintf('Errore massimo Simpson Composto: %i\n', errore);
end