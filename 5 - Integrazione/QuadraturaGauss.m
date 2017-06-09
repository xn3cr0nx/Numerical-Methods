% f: funzione inline
% a, b: estremi dell'intervallo in cui calcolare l'integrale
% n: numero di punti da usare. AL MOMENTO n PUO' VALERE SOLO 2 O 3
% (se si vogliono usare più punti, basta modificare opportunamente le
%  matrici R e C)

function integrale = QuadraturaGauss(f, a, b, n)
  % Roots
  R = [0.5773502692 -0.5773502692 0;
       0.7745966692  0           -0.7745966692];
  
  % Coefficients
  C = [1            1            0;
       0.5555555556 0.8888888889 0.5555555556];
  
  % Sommatoria che compare nella formula
  somma_parziale = 0;
  for j=1:n
    somma_parziale = somma_parziale + C(n-1,j)*f(((b-a)*R(n-1,j) + b+a)/2);
  end
  
  integrale = (b-a)/2 * somma_parziale;
  
end