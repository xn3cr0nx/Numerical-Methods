% f: è una inline function, esempio "f = inline('x^2+1')"
% p: punto in cui calcolare la pendenza
% h: incremento del rapporto incrementale
%
% Restituisce la pendenza della tangente di f nel punto p

function slope = Slope(f, p, h)
    slope = (f(p+h) - f(p))/h;
end