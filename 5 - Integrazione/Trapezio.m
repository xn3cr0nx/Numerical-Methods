% f: funzione inline
% a, b: estremi dell'intervallo in cui calcolare l'integrale

function integrale = Trapezio(f, a, b)
  integrale = (f(a) + f(b))*(b - a)/2;
  disp('Metodo del Trapezio')
  fprintf('(f(%i)+f(%i))*(%i-%i)/2 = %i\n', a, b, b, a, integrale);
end