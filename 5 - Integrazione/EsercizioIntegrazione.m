function [  ] = Integrazione( a, b, f, f2, f4, maxf2, maxf4, val, n )

disp('riferimento es pag. 25')
fprintf('a: %i, b: %i\n', a, b);
fprintf('f(a): %i, f(b): %i, scrivere passaggi(sostituire)\n', f(a), f(b));
fprintf('valore esatto: %i\n', val);

fprintf('\n ---------------------------------- \n\n');

% int1 = Trapezio(f, a, b);
% % err_abs1 = abs(int1 - valore_esatto);
% fprintf('Errore assoluto Trapezio: %i\n', abs(int1 - val));
% err1 = ErroreTrapezio(f2, a, b, maxf2);
% 
% fprintf('\n ---------------------------------- \n\n');
% 
% int2 = Simpson(f, a, b);
% % err_abs2 = abs(int2 - valore_esatto);
% fprintf('Errore assoluto Simpson: %i\n', abs(int2 - val));
% err_2 = ErroreSimpson(f4, a, b, maxf4);
% 
% fprintf('\n ---------------------------------- \n\n');

int1 = TrapezioComposto(f, a, b, n);
% err_abs1 = abs(int1 - valore_esatto);
fprintf('Errore assoluto Trapezio: %i\n', abs(int1 - val));
err_max1 = ErroreTrapezioComposto(f2, a, b, n, maxf2);

fprintf('\n ---------------------------------- \n\n');

int2 = SimpsonComposto(f, a, b, n);
% err_abs2 = abs(int2 - valore_esatto);
fprintf('Errore assoluto Simpson: %i\n', abs(int2 - val));
err_max2 = ErroreSimpsonComposto(f4, a, b, n, maxf4);


fprintf('\n ---------------------------------- \n\n');
end

