% Circuit Analysis Using NR Method
% Problem: Series Resistor-Diode Circuit
% Determine Diode Voltage and Current of Series Resistor-Diode Circuit
clc;
clear all;
close all;
% Step-1: Define circuit parameters
Vs = 5;                  % Source voltage in volts
R = 1000;                % Resistance in ohms
Is = 1e-12;              % Diode saturation current in amperes
n = 1;                   % Diode ideality factor
Vt = 0.02585;            % Thermal voltage in volts
% Step-2: Set initial values
Vd = 0.7;                % Initial diode voltage in volts
tolerance = 1e-6;        % Required accuracy
max_iter = 100;          % Maximum number of iterations
% Create arrays to store the results.
Vd_history = zeros(max_iter + 1, 1);
error_history = zeros(max_iter, 1);
Vd_history(1) = Vd;
converged = false;
% Step-3: Define the nonlinear circuit equation
% Apply Kirchhoff's voltage law and the diode equation.
% The equation is solved by making f(Vd) equal to zero.
% Step-4: Calculate the derivative
% Calculate the first derivative of the circuit equation.
% The derivative is used in the Newton-Raphson formula.
% Step-5: Apply the Newton-Raphson method
% Update the diode voltage until the solution converges.
fprintf('\nNewton-Raphson circuit analysis\n');
fprintf('%-10s %-16s %-16s\n','Iteration', 'Vd (V)', 'Error');
for k = 1:max_iter
    % Calculate the exponential term.
    exponential_term = exp(Vd/(n*Vt));
    % Calculate the nonlinear function.
    f = (Vs - Vd)/R - Is*(exponential_term - 1);
    % Calculate the derivative of the function.
    df = -1/R - (Is/(n*Vt))*exponential_term;
    % Check whether the function and derivative are valid.
    if ~isfinite(f) || ~isfinite(df) || df == 0
        error('Invalid function or derivative.');
    end
    % Calculate the new diode voltage.
    Vd_new = Vd - f/df;
    % Check whether the new voltage is valid.
    if ~isfinite(Vd_new)
        error('Invalid diode voltage.');
    end
    % Calculate the error between successive voltages.
    current_error = abs(Vd_new - Vd);
    % Store the voltage and error values.
    Vd_history(k + 1) = Vd_new;
    error_history(k) = current_error;
    % Display the current iteration results.
    fprintf('%-10d %-16.8f %-16.3e\n', k, Vd_new, current_error);
    % Update the diode voltage.
    Vd = Vd_new;
    % Stop the iteration when the required accuracy is reached.
    if current_error < tolerance
        converged = true;
        break;
    end
end
% Step-6: Check the convergence status
% Check whether the solution has converged.
if converged
    fprintf('\nThe solution has converged.\n');
else
    warning('The solution did not converge.');
end
% Remove unused elements from the arrays.
Vd_history = Vd_history(1:k+1);
error_history = error_history(1:k);
% Step-7: Calculate the final circuit values
% Calculate the diode current.
Id = (Vs - Vd)/R;
% Calculate the resistor voltage.
Vr = Id*R;
% Calculate the diode power.
Pd = Vd*Id;
% Step-8: Display the final results
% Display the calculated voltage, current, and power.
fprintf('\nFinal circuit results\n');
fprintf('Number of iterations : %d\n', k);
fprintf('Diode voltage        : %.6f V\n', Vd);
fprintf('Diode current        : %.6f A\n', Id);
fprintf('Diode current        : %.4f mA\n', Id*1000);
fprintf('Resistor voltage     : %.6f V\n', Vr);
fprintf('Diode power          : %.6f W\n', Pd);
% Verify Kirchhoff's voltage law.
fprintf('KVL error             : %.3e V\n', Vs - Vr - Vd);
% Step-9: Plot the convergence error
% Plot the error at each iteration.
figure('Name', 'Convergence error', 'Color', 'w');
semilogy(1:k, max(error_history, eps), 'o-', 'LineWidth', 1.5, 'MarkerSize', 6);
grid on;
xlabel('Iteration number');
ylabel('Absolute error (V)');
title('Newton-Raphson convergence error');
% Step-10: Plot the diode voltage
% Plot the diode voltage at each iteration.
figure('Name', 'Diode voltage convergence', 'Color', 'w');
plot(0:k, Vd_history,'s-', 'LineWidth', 1.5, 'MarkerSize', 6);
grid on;
xlabel('Iteration number');
ylabel('Diode voltage (V)');
title('Diode voltage convergence');
