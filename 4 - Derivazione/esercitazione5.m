%% ESERCIZIO 1
clear all
clc

format long

f = inline('x*exp(x)');

valore_esatto = 22.167168;

% Nota sul calcolo dell'errore lagrangiano:
% ho calcolato sul foglio di carta le derivate necessarie,
% poi ho preso il valore di 'xi' tale che massimizza l'errore
% Qui sotto: f2 = derivata seconda, f3 = derivata terza, ecc.
f2 = inline('2*exp(x) + x*exp(x)');
f3 = inline('3*exp(x) + x*exp(x)');
f5 = inline('5*exp(x) + x*exp(x)');

d1 = DuePunti(f, 2.0, 0.1)
errore_abs1 = abs(valore_esatto - d1)
max_err1 = abs(0.1/2 * f2(2.1))

d2 = DuePunti(f, 2.0, -0.1)
errore_abs2 = abs(valore_esatto - d2)
max_err2 = abs(-0.1/2 * f2(2))

d3 = TrePuntiCentrale(f, 2.0, 0.1)
errore_abs3 = abs(valore_esatto - d3)
max_err3 = abs(0.1^2/6 * f3(2.1))

d4 = TrePuntiCentrale(f, 2.0, 0.2)
errore_abs4 = abs(valore_esatto - d4)
max_err4 = abs(0.2^2/6 * f3(2.2))

d5 = TrePuntiEstremo(f, 2.0, 0.1)
errore_abs5 = abs(valore_esatto - d5)
max_err5 = abs(0.1^2/3 * f3(2.2))

d6 = TrePuntiEstremo(f, 2.0, -0.1)
errore_abs6 = abs(valore_esatto - d6)
max_err6 = abs(-0.1^2/3 * f3(2))

d7 = CinquePuntiCentrale(f, 2.0, 0.1)
errore_abs7 = abs(valore_esatto - d7)
max_err7 = abs(0.1^4/30 * f5(2.2))


%% ESERCIZIO 2
clear all
clc

f = inline('sin(x)');
f3 = inline('-cos(x)');

valore_esatto = 0.62160997;

valori_di_h = [0.1 0.05 0.02 0.01 0.005 0.002 0.001];

for h = valori_di_h
  fprintf(1, '\nValore di h: %f', h)
  d = TrePuntiCentrale(f, 0.9, h)
  errore_abs = abs(valore_esatto - d)
  max_err = abs(h^2/6 * f3(0.9-h))
end