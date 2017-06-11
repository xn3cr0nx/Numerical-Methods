clear
clc

% funzione = '(x^2)*cos(x)';
% funzione2 = '2*cos(x) -4*x*sin(x) -x^2*cos(x)'; % derivata seconda
% funzione4 = 'x^2*cos(x) -12*cos(x) +8*x*sin(x)'; % derivata quarta
funzione = '((8/(x^2)))*sin(3*x)';
funzione2 = '-(24*(4*x*cos(3*x)+(-2+3*x^2)*sin(3*x)))/x^4';
funzione4 = '(24*(24*x*(-4+3*x^2)*cos(3*x)+(40-108*x^2+27*x^4)*sin(3*x)))/x^6';
f = inline(funzione);
f2 = inline(funzione2);
f4 = inline(funzione4);
% a = 0;
% b = pi;
a = 0.45;
b = 3.40;
valore_esatto = 0;
% n = 6;
n = 8;


%% Plotto il grafico per vedere il massimo di f2 e f4 nell'intervallo [a,b]
%fplot(funzione2, [a,b])
%fplot(funzione4, [a,b])

% maxf2 = pi;
% maxf4 = 2.18;
maxf2 = 0.45;
maxf4 = 0.45;

EsercizioIntegrazione(a, b, f, f2, f4, maxf2, maxf4, valore_esatto, n);

%% CALCOLO DI h E n
tolleranza = 10^-4;

% Metodo trapezi
h = ((12*tolleranza)/((b-a)*f2(maxf2)))^(1/2);
n = (b-a)/h;

fprintf('\n ---------------------------------- \n\n');
fprintf('Calcolo di h e n per metodo dei trapezi\n\n');
fprintf('errore_max = |f2(xi)*(b-a)*(h^2)/12|\n');
fprintf('Isolo h, e ottengo: h = sqrt((12*errore_max)/((b-a)*f2(xi)))\n');
fprintf('                      = sqrt((12* %d)/((%d - %d)* %d))\n', tolleranza, b, a, f2(maxf2));
fprintf('                      = %d\n', h);

fprintf('\nQuindi n = (b-a)/h = (%d - %d)/%d = %d\n', b, a, h, n);
fprintf('(arrotonda `n` per eccesso, e con tale valore ricalcola h = (b-a)/n)\n');

% Se sei curioso di vedere quanto viene
% TrapezioComposto(f, a, b, n)


% Metodo Simpsons
h = ((180*tolleranza)/((b-a)*f4(maxf4)))^(1/4);
n = (b-a)/h;

fprintf('\n ---------------------------------- \n\n');
fprintf('Calcolo di h e n per metodo di Simpsons\n\n');
fprintf('errore_max = |f4(xi)*(b-a)*(h^4)/180|\n');
fprintf('Isolo h, e ottengo: h = ((180*errore_max)/((b-a)*f4(xi)))^(1/4)\n');
fprintf('                      = ((180* %d)/((%d - %d)* %d))^(1/4)\n', tolleranza, b, a, f4(maxf4));
fprintf('                      = %d\n', h);

fprintf('\nQuindi n = (b-a)/h = (%d - %d)/%d = %d\n', b, a, h, n);
fprintf('(arrotonda `n` per eccesso, e con tale valore ricalcola h = (b-a)/n)\n');


% Se sei curioso di vedere quanto viene
% SimpsonComposto(f, a, b, n)