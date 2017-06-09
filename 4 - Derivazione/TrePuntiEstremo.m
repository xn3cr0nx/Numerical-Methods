% f: funzione inline
% x: punto in cui calcolare la derivata
% h: incremento del rapporto incrementale

function derivata = TrePuntiEstremo(f, x, h)
  derivata = (-3*f(x) + 4*f(x+h) - f(x+2*h))/(2*h);
end