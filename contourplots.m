% Generate contour plots by fixing mu, gamma, lambda(???) 
% Then what's remaining is just alpha, beta

% I(0.02, 0.06, [0.25, 0.18, 0.29], 0.15, 0.03) 
mu = [0.25, 0.18, 0.29]; 
gamma = 0.03; 

Alpha = 0.01:0.05:0.30; 

lambda = 0.01:0.001:0.3; 
beta = 0.01:0.001:0.12; 
[Lambda,Beta] = meshgrid(lambda, beta); 
% Z = (mu(2)*(Alpha.*gamma + mu(3) - lambda))./(mu(2)*(Alpha.*gamma + mu(3) - lambda) - lambda) .* (lambda.*(gamma + mu(3)).*(1 + (Alpha/mu(2))) - (gamma + mu(3)).*(Alpha + mu(1)))./(Beta.*(theta.*gamma + mu(3)));
figure
for i = 1:length(Alpha)
    subplot(3,2,i)
    alpha = Alpha(i); 
    Ybar = (gamma + mu(3))./Beta; 
    Ibar = mu(2).*Lambda.*Ybar.*(1 + alpha/mu(2))./(alpha*gamma .*(mu(2) - Lambda) + mu(3))- mu(2).*(gamma + mu(3))*(alpha + mu(1))./(Beta.*alpha.*gamma.*(mu(2)-Lambda) + mu(3)); 
    Mbar = alpha.*Ybar./mu(2) + alpha.*gamma.*Ibar./mu(2); 
%     Z = Ibar./(Ybar + Ibar + Mbar) ; 

    contour(Lambda,Beta,Ibar,15,'ShowText','on')
    ylabel('Beta')
    xlabel('Lambda')
    title(strcat('Contour plots of equilibrium infected population; alpha = ', num2str(Alpha(i))))
end