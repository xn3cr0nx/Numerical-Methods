clear
clc

funzione = '(x^2)*cos(x)';
funzione2 = '2*cos(x) -4*x*sin(x) -x^2*cos(x)'; % derivata seconda
funzione4 = 'x^2*cos(x) -12*cos(x) +8*x*sin(x)'; % derivata quarta
f = inline(funzione);
f2 = inline(funzione2);
f4 = inline(funzione4);
a = 0;
b = pi;
valore_esatto = 0;
n = 6;


% Plotto il grafico per vedere il massimo di f2 e f4 nell'intervallo [0,2]
%fplot(funzione2, [a,b])
%fplot(funzione4, [a,b])

maxf2 = pi;
maxf4 = 2.18;

EsercizioIntegrazione(a, b, f, f2, f4, maxf2, maxf4, valore_esatto, 6);

%% CALCOLO DI h E n
tolleranza = 10^-4;

n = 1;
errore = 100000; % valore a caso per entrare nel while
while (abs(errore) > tolleranza)
  n = n + 1; % Primo valore: 2
  errore = ErroreTrapezioComposto(f2, a, b, n, maxf2);  
end
% errore
n 
h = (b-a)/n

% Se sei curioso di vedere quanto viene
% TrapezioComposto(f, a, b, n)

n = 0;
errore = 100000; % valore a caso per entrare nel while
while (abs(errore) > tolleranza)
  n = n + 2; % Primo valore: 2
  errore = ErroreSimpsonComposto(f4, a, b, n, maxf4); 
end
% errore
n
h = (b-a)/n

% Se sei curioso di vedere quanto viene
% SimpsonComposto(f, a, b, n)