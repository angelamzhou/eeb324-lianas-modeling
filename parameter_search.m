% parameter sets for Ibar within a certain range

low_cand = 0.4; 
high_cand = 0.6; 

loops = 2000; 

candidates = cell(0); 
successes = 0 ; 
for i = 1:loops
    if mod(i, 100) == 0
        disp(i)
    end
    for alpha = linspace(0.02, 0.35, 100)
        beta = rand()*(0.12); 
        gamma = rand()* (0.05 - 0.02) + 0.02; 
%         Rules for generating lambda
        lambda = random('unif', 0, 0.1);
%         lambda(1) = random('unif', 0, 0.1); 
%       rules for generating mu 
% generate 
        mu = ones(1,3); %*random('unif', 0, 0.15); 
        mu(1) = random('unif', 0, 0.15); 
        mu(2) = random('unif', 0, 0.15); 
        mu(3) = random('unif', 0, 0.15); 
      
        Ibar = I(alpha, beta, mu, lambda, gamma); 
        if Ibar < high_cand & Ibar > low_cand
            successes = successes + 1; 
            % store in solutions? 
            candidates{successes} = [alpha beta mu lambda gamma] ; 
        end
    end
end
candmat = zeros(successes, length(candidates{1})); 
for i = 1:successes
    for j = 1:length(candidates{1})
        candmat(i,j)= candidates{i}(j); 
    end
end