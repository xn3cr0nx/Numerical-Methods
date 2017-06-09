%% ESERCIZIO 4
clear all
clc

funzione = '(1+x^2)^(1/2)';
funzione2 = '(1+x^2)^(-1/2) -(x^2)*(1+x^2)^(-3/2)'; % derivata seconda
funzione4 = '3*(4*x^2 -1)/(x^2 +1)^(7/2)'; % derivata quarta
f = inline(funzione);
f2 = inline(funzione2);
f4 = inline(funzione4);
a = 0;
b = 2;
valore_esatto = 2.958;

% disp('riferimento es pag. 25')
% fprintf('a: %i, b: %i\n', a, b);
% fprintf('f(a): %i, f(b): %i, scrivere passaggi(sostituire)\n', f(a), f(b));
% fprintf('valore esatto: %i\n', valore_esatto);
% 
% disp(' ')
% 
% int1 = Trapezio(f, a, b);
% % err_abs1 = abs(int1 - valore_esatto);
% fprintf('Errore assoluto Trapezio: %i\n', abs(int1 - valore_esatto));
% err1 = ErroreTrapezio(f2, a, b, 0);
% 
% disp(' ')
% 
% int2 = Simpson(f, a, b);
% % err_abs2 = abs(int2 - valore_esatto);
% fprintf('Errore assoluto Simpson: %i\n', abs(int2 - valore_esatto));
% err_max2 = ErroreSimpson(f4, a, b, 0.866);

% Plotto il grafico per vedere il massimo di f4 nell'intervallo [0,2]
fplot(funzione4, [a,b])

EsercizioIntegrazione(a, b, f, f2, f4, 0, 0, valore_esatto, 16);



%% ESERCIZIO 5
clear all
clc

funzione = 'x^4';
funzione2 = '12*x^2';
funzione4 = '24';
f = inline(funzione);
f2 = inline(funzione2);
f4 = inline(funzione4);
a = 0.5;
b = 1;

valore_esatto = 0.19375;

EsercizioIntegrazione(a, b, f, f2, f4, 0, 0, valore_esatto, 16);


%% ESERCIZIO 6
clear all
clc

funzione = 'exp(x)';
funzione2 = 'exp(x)';
funzione4 = 'exp(x)';
f = inline(funzione);
f2 = inline(funzione2);
f4 = inline(funzione4);
a = 0;
b = 4;

valore_esatto = 53.59815;

n = 16;

% int1 = TrapezioComposto(f, a, b, n);
% err_abs1 = abs(int1 - valore_esatto);
% err_max1 = ErroreTrapezioComposto(f2, a, b, n, 4);
% 
% int2 = SimpsonComposto(f, a, b, n);
% err_abs2 = abs(int2 - valore_esatto);
% err_max2 = ErroreSimpsonComposto(f4, a, b, n, 4);
% 

EsercizioIntegrazione(a, b, f, f2, f4, 4, 4, valore_esatto, 16);

 
%% ESERCIZIO 9
clear all
clc

funzione = 'sin(x)';
funzione2 = '-sin(x)';
funzione4 = 'sin(x)';
f = inline(funzione);
f2 = inline(funzione2);
f4 = inline(funzione4);
a = 0;
b = pi;

tolleranza = 2*10^-5;

n = 2;
errore = 100000;
while (abs(errore) > tolleranza)
  errore = ErroreTrapezioComposto(f2, a, b, n, pi/2);
  n = n + 1;
end
% errore
n = n-1 % Occhio, nel while loop incremento n anche nell'ultimo ciclo
h = (b-a)/n

n = 2;
errore = 100000;
while (abs(errore) > tolleranza)
  errore = ErroreSimpsonComposto(f4, a, b, n, pi/2);
  n = n + 2;
end
% errore
n = n-2 % Occhio, nel while loop incremento n anche nell'ultimo ciclo
h = (b-a)/n
 
 
%% ESERCIZIO 10

%% Punto a)
clear all
clc

funzione = 'exp(x)*cos(x)';
f = inline(funzione);
a = -1;
b = 1;

valore_esatto = 1.9334214;

% Gauss 2 punti
int2 = QuadraturaGauss(f, a, b, 2)
err_abs2 = abs(int2 - valore_esatto)

% Gauss 3 punti
int3 = QuadraturaGauss(f, a, b, 3)
err_abs3 = abs(int3 - valore_esatto)

int4 = Trapezio(f, a, b)
err_abs4 = abs(int4 - valore_esatto)

int5 = TrapezioComposto(f, a, b, 2)
err_abs5 = abs(int5 - valore_esatto)

int6 = Simpson(f, a, b)
err_abs6 = abs(int6 - valore_esatto)


%% Punto b)
clear all
clc

funzione = 'x^6 -(x^2)*sin(2*x)';
f = inline(funzione);
a = 1;
b = 3;

valore_esatto = 317.3442466;

% Gauss 2 punti
int2 = QuadraturaGauss(f, a, b, 2)
err_abs2 = abs(int2 - valore_esatto)

% Gauss 3 punti
int3 = QuadraturaGauss(f, a, b, 3)
err_abs3 = abs(int3 - valore_esatto)

int4 = Trapezio(f, a, b)
err_abs4 = abs(int4 - valore_esatto)

int5 = TrapezioComposto(f, a, b, 2)
err_abs5 = abs(int5 - valore_esatto)

int6 = Simpson(f, a, b)
err_abs6 = abs(int6 - valore_esatto)
