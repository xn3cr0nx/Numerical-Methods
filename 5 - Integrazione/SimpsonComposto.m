% f: funzione inline
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% n: numero di sottointervalli. DEVE ESSERE PARI

function integrale = SimpsonComposto(f, a, b, n)
  disp('Metodo di Simpson Composto')
  h = (b-a)/n;
  fprintf('h = (b-a)/n = (%i-%i)/%i = %i\n', b, a, n, h);
  somma_parziale1 = 0;
  somma_parziale2 = 0;
  
  fprintf('\n2*somm(xpari) = 2*somm(f(a+2*j*h)) = \n')
  for j=1:((n/2)-1)
    disp('+')
    somma_parziale1 = somma_parziale1 + f(a+2*j*h);
    fprintf('f(%i+2*%i*%i) = %i\n', a, j, h, f(a+2*j*h)); 
  end
  fprintf(' = %i\n', somma_parziale1);
  
  fprintf('\n4*somm(xdispari) = 4*somm(f(a+(2*j-1)*h)) = \n')
  for j=1:(n/2)
    disp('+')
    somma_parziale2 = somma_parziale2 + f(a+(2*j-1)*h);
    fprintf('f(%i+(2*%i-1)*%i) = %i\n', a, j, h, f(a+(2*j-1)*h));
  end
  fprintf(' = %i\n', somma_parziale2);
  
  integrale = (h/3)*(f(a) + 2*somma_parziale1 + 4*somma_parziale2 + f(b));
  disp('integrale = (h/3)*(f(a)+2*somm(xpari)+4*somm(xdispari)+f(b) =');
  fprintf('= (%i/3)*(f(%i)+2*%i+4*%i+f(%i) =\n', h, a, somma_parziale1, somma_parziale2, b);
  fprintf('= (%i)*(%i+%i+%i+%i) = %i\n', h/3, f(a), 2*somma_parziale1, 4*somma_parziale2, f(b), integrale)
end