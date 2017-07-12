%% ESERCIZIO 1
clear all
clc

format long

funzione = ('3*x*exp(x)-sin(x)');

valore_esatto = 22.167168;

% Nota sul calcolo dell'errore lagrangiano:
% ho calcolato sul foglio di carta le derivate necessarie,
% poi ho preso il valore di 'xi' tale che massimizza l'errore
% Qui sotto: f2 = derivata seconda, f3 = derivata terza, ecc.
funzione1 = ('3*(exp(x))*(1+x)-cos(x)');
funzione2 = ('3*(exp(x))*(2+x)+sin(x)');
funzione3 = ('3*(exp(x))*(3+x)+cos(x)');
% f4 = '3*e^x*(4+x)-sin(x)'
funzione5 = ('3*(exp(x))*(5+x)-cos(x)');
f = inline(funzione);
f1 = inline(funzione1);
f2 = inline(funzione2);
f3 = inline(funzione3);
f5 = inline(funzione5);


% d1 = DuePunti(f, 2.0, 0.1)
% errore_abs1 = abs(valore_esatto - d1)
% max_err1 = abs(0.1/2 * f2(2.1))
% 
% d2 = DuePunti(f, 2.0, -0.1)
% errore_abs2 = abs(valore_esatto - d2)
% max_err2 = abs(-0.1/2 * f2(2))

d3 = TrePuntiCentrale(f, 1.30, 0.1)
errore_abs3 = abs(valore_esatto - d3)
max_err3 = abs(0.1^2/6 * f3(1.4))

% d4 = TrePuntiCentrale(f, 1.30, 0.2)
% errore_abs4 = abs(valore_esatto - d4)
% max_err4 = abs(0.2^2/6 * f3(1.5))

d5 = TrePuntiEstremo(f, 1.30, 0.1)
errore_abs5 = abs(valore_esatto - d5)
max_err5 = abs(0.1^2/3 * f3(2.2))

% d6 = TrePuntiEstremo(f, 1.30, -0.1)
% errore_abs6 = abs(valore_esatto - d6)
% max_err6 = abs(-0.1^2/3 * f3(2))

% d7 = CinquePuntiCentrale(f, 2.0, 0.1)
% errore_abs7 = abs(valore_esatto - d7)
% max_err7 = abs(0.1^4/30 * f5(2.2))


%% ESERCIZIO 2
% clear all
% clc
% 
% f = inline('sin(x)');
% f3 = inline('-cos(x)');
% % 
% valore_esatto = 0.62160997;
% 
% valori_di_h = [1.20 1.25 1.29 1.30 1.31 1.35 1.40];
% 
% x = 1.30
% 
% for h = valori_di_h
%   fprintf(1, '\nValore di h: %f', h)
%   d = TrePuntiCentrale(f, x, h)
%   errore_abs = abs(valore_esatto - d)
%   max_err = abs(h^2/6 * f3(x-h))
% end