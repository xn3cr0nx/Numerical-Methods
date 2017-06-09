% f: funzione inline
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% n: numero di sottointervalli

function integrale = TrapezioComposto(f, a, b, n)
  disp('Metodo del Trapezio Composto')
  h = (b-a)/n;
  fprintf('h = (b-a)/n = (%i-%i)/%i = %i\n', b, a, n, h);
  
  fprintf('\nsomm(f(xj)) = somm(f(a+j*h)) = \n');
  somma_parziale = 0; % è la sommatoria che compare nella formula
  for j=1:(n-1)
    somma_parziale = somma_parziale + f(a+j*h);
     fprintf('f(%i+%i*%i) = %i\n', a, j, h, f(a+j*h)); 
  end
  fprintf(' = %i\n\n', somma_parziale);
  
  integrale = (h/2)*(f(a) + 2*somma_parziale + f(b));
  disp('integrale = (h/2)*(f(a)+2*somm(f(xj))+f(b) =');
  fprintf('= (%i/2)*(f(%i)+2*%i+f(%i) =\n', h, a, somma_parziale, b);
  fprintf('= (%i)*(%i+%i+%i) = %i\n\n', h/3, f(a), 2*somma_parziale, f(b), integrale)
end