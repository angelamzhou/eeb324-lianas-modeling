mu_y = 0.25;
mu_m = 0.18; 
gamma = 0.03; 
alpha = 0.05; 
lambda = 0.2; 

% Generate grid of varying parameters
num_points = 1000;
beta = linspace(0.01, 0.12, num_points);
mu_i = linspace(0.2, 0.6, num_points);
[Mu_i, Beta] = meshgrid(mu_i, beta);

% Calculate endemic equilibrium
Y_bar = (gamma + Mu_i) ./ Beta;
I_bar = ((mu_m * Y_bar * (1 + alpha/mu_m)) ./ ...
    (alpha*gamma*(mu_m - lambda) + Mu_i)) ...
    - ((mu_m * (gamma + Mu_i) * (alpha + mu_y)) ...
    ./ (Beta*alpha*gamma * (mu_m - lambda) + Mu_i));
M_bar = (alpha*Y_bar + alpha*gamma*I_bar) / mu_m;

I_proportion = I_bar ./ (Y_bar + I_bar + M_bar);

subplot(1, 2, 1);
contour(beta, mu_i, I_proportion, 'LineWidth', 2, 'ShowText', 'on');
xlabel('\beta');
ylabel('\mu_I');
title('Proportion of lianas infestation');

subplot(1, 2, 2);
contour(beta, mu_i, I_bar, 'LineWidth', 2, 'ShowText', 'on');
xlabel('\beta');
ylabel('\mu_I');
title('Absolute lianas infestation');
