%xikai xu 400440917 

% Define the differential equation
f = @(x, y) x - y;

% Define the exact solution function
exact_solution = @(x) 2 * exp(-x) + x - 1;

% Define Euler's method
euler_method = @(f, x0, y0, h, n) deal(x0 + (0:n) * h, y0 + cumsum(h * f(x0 + (0:n) * h, y0)));

% Initial condition
x0 = 0;
y0 = 1;

% Step sizes
hs = [0.4, 0.2, 0.1];

% Number of steps
n_values = round(2 ./ hs);

% Plot
figure;
hold on;

% Plot exact solution
x_exact = linspace(0, 2, 100);
y_exact = exact_solution(x_exact);
plot(x_exact, y_exact, 'b', 'LineWidth', 2, 'DisplayName', 'Exact Solution');

% Plot Euler's method approximations
colors = {'r', 'g', 'm'};
for i = 1:length(hs)
    h = hs(i);
    n = n_values(i);
    [x_values, y_values] = euler_method(f, x0, y0, h, n);
    plot(x_values, y_values, 'Color', colors{i}, 'LineWidth', 2, 'DisplayName', ['Euler h=' num2str(h)]);
end

xlabel('x');
ylabel('y');
title('Euler''s Method Approximations vs Exact Solution');
legend('Location', 'best');
grid on;

hold off;
