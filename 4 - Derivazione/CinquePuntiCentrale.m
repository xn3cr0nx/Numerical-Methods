% f: funzione inline
% x: punto in cui calcolare la derivata
% h: incremento del rapporto incrementale

function derivata = CinquePuntiCentrale(f, x, h)
  derivata = (f(x-2*h) -8*f(x-h) +8*f(x+h) -f(x+2*h))/(12*h);
end