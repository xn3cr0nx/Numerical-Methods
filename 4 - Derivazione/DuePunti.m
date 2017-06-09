% f: funzione inline
% x: punto in cui calcolare la derivata
% h: incremento del rapporto incrementale

function derivata = DuePunti(f, x, h)
  derivata = (f(x+h) - f(x))/h;
end