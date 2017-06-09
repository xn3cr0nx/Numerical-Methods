% f2: funzione inline, derivata seconda di f
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% xi: valore di xi che rende massimo l'errore

function errore = ErroreTrapezio(f2, a, b, xi)
  errore = abs((f2(xi)/12)*(b-a)^3);
  disp('ricordarsi di plottare per trovare il max della funzione')
  fprintf('Errore Trapezio: (f2(%i)/12)*(%i-%i)^3 =  %i\n', xi, b, a, errore);
end