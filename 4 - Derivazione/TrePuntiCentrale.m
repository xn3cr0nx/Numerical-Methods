% f: funzione inline
% x: punto in cui calcolare la derivata
% h: incremento del rapporto incrementale

function derivata = TrePuntiCentrale(f, x, h)
  derivata = (f(x+h) - f(x-h))/(2*h);
end