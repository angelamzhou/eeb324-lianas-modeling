function Ibar = I(alpha, beta, mu, lambda, gamma)
% Y = 1
% M = 2 
% I = 3 

% global Y M I
% nonzero checks

theta = alpha;
Ibar = (mu(2)*(alpha*gamma + mu(3) - lambda))/(mu(2)*(alpha*gamma + mu(3) - lambda) - lambda) * (lambda*(gamma + mu(3))*(1 + (alpha/mu(2))) - (gamma + mu(3))*(alpha + mu(1)))/(beta*(theta*gamma + mu(3)));
% Ibar = ((gamma + mu(3))/beta *( mu(2) + alpha - lambda(1) - lambda(2)/mu(2)*alpha )) /(lambda(2)/mu(2)*alpha*gamma + lambda(1) - mu(1)) ; 