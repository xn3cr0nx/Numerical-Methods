function errore = ErroreLagrange(grado_derivata, max_derivata, f_derivata, x, x_points)

  n = length(x_points);
  prodotto_binomi = 1;
  for i=1:n
    prodotto_binomi = prodotto_binomi * (x - x_points(i));
  end
    
  errore = abs((f_derivata(max_derivata)/factorial(grado_derivata))*prodotto_binomi);
end