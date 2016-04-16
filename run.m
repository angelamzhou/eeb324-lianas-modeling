% N_0 = 100
Y = 100; 
M = 0; 
I = 0; 

% 10-50% of trees are infected with lianas
% Each liana connects about 1.5 trees -> Rnaught 1.5
% 
% Positive density dependence in infected - put function beta
% Lianas abundance -> positive correlation with pioneering species and
% negative correlation with non pioneering species

% corresponds with 10 year maturation 
lambda = 0.07; 
alpha = 0.1; 
beta = 0.2; 
gamma = 0.05; 
theta = 0.8; 
mu = [0.05 0.06 0.09]; 
%     One model scenario: ceteris paribus, increase tree mortality
% another scenario: levels of virulence: infected death rate? 
% 
t0 = 0; 
tf = 100; 
[T_out, n_out] = ode45(@(t,N) YMI(t,N, alpha, beta, gamma, theta, mu, lambda), [t0 tf], [Y M I] );
figure(1) 
hold on 
plot(T_out, n_out(:,1)); 
plot(T_out,n_out(:,2)); 
plot(T_out, n_out(:,3)); 
legend('Young', 'Mature', 'Infected')
hold off
