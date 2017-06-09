% f: funzione inline
% x: punto in cui calcolare la derivata
% h: incremento del rapporto incrementale

function derivata = CinquePuntiEstremo(f, x, h)
  derivata = (-25*f(x) +48*f(x+h) -36*f(x+2*h) +16*f(x+3*h) -3*f(x+4*h))/(12*h);
end