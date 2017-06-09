% f2: funzione inline, derivata seconda di f
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% n: numero di sottointervalli
% xi: valore di xi che rende massimo l'errore

function errore = ErroreTrapezioComposto(f2, a, b, n, xi)
  h = (b-a)/n;
  
  errore = f2(xi)*(b-a)*(h^2)/12;
  fprintf('Errore massimo Trapezio Composto: %i\n', errore);
end