clear all
clc

funzione = '(5/(x^2))*sin(3/x)'; % --- INSERIRE I DATI
f = inline(funzione);

% Punti da interpolare
X_points = [1/2, 3/2, 2]; % --- INSERIRE I DATI
for i=1:length(X_points)
  Y_points(i) = f(X_points(i));
end

% Punti in cui valutare la funzione
x = [1, 2.5, 3]; % --- INSERIRE I DATI


%% Calcolo errore Lagrange

funzione3 = '-pi^3 *cos(pi*x)'; % derivata terza --- INSERIRE I DATI (se necessario)
f3 = inline(funzione3);

chiede_err_max = input('Viene richiesto di stimare l errore massimo? 1 = Sì, 0 = No: ');

if chiede_err_max == 1
  % Plotto la derivata, SOSTITUISCI BENE GLI ESTREMI, CONSIDERA ANCHE IL
  % PUNTO x IN CUI VALUTI LA FUNZIONE
  fplot(funzione3, [0, 1/2]);

  max_derivata = 0;
  grado_derivata = length(X_points);
end

%% Polinomi di Lagrange

P = PolinomioLagrange(X_points, Y_points, f);
fP = inline(P);

for i=1:length(x)
  fprintf('\n\nFunzione calcolata nel punto %i: %i\n', x(i), fP(x(i)));
  fprintf('Errore assoluto:\t %d\n', abs(fP(x(i)) - f(x(i)))');
  if chiede_err_max == 1
    err_max = ErroreLagrange(grado_derivata, max_derivata, f3, x(i), X_points);
  end
end



%% DIFF DIVISE


% X_points(4) = 3/4;
% Y_points = f(X_points);
D = DiffDivise(X_points, Y_points);

P2 = PolinomioDiffDivise(D, X_points);
fP2 = inline(P2);

for i=1:length(x)
  fprintf('\n\nFunzione calcolata nel punto %i: %i\n', x(i), fP2(x(i)));
  fprintf('Errore assoluto:\t %d\n', abs(fP2(x(i)) - f(x(i)))');
end







