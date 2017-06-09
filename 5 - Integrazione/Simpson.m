% f: funzione inline
% a, b: estremi dell'intervallo in cui calcolare l'integrale

function integrale = Simpson(f, a, b)
  integrale = ((b - a)/6)*(f(a) + 4*f((a+b)/2) + f(b));
  disp('Metodo di Simpson')
  fprintf('((%i-%i)/6)*(f(%i)+4*f(%i+%i)/2)+f(%i)) = ', b, a, a, a, b, b);
  fprintf('%i\n', integrale);
end