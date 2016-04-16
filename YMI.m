function dndt = YMI(t, N, alpha, beta, gamma, theta, mu, lambda)
% Y = 0.5;
% M = 0.5; 
% I = 0; 

% global Y M I
Y = N(1);
M = N(2) ;
I = N(3) ;

mu_Y = mu(1);
mu_M = mu(2);
mu_I = mu(3);

    dndt(1,1) = lambda * (Y+M+I) + (1 - theta)*gamma*I - (mu_Y + alpha * beta*I)*Y ;% equation for dY dt
    dndt(2,1) = beta*Y*I - (gamma + mu_I)*I; % equation for dM dt
    dndt(3,1) = alpha*Y + theta*gamma*I - mu_M * M; % equation for dI dt
    
   