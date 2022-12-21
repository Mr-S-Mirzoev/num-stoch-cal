function Y = EulerMaruyama(T, xi, W)
N = size(W,1) - 1; % number of equally spaced time intervals 
Delta = T/N; % lenght of equally spaced time intervals
M = size (W,2); % number of samples
mu = @(x) 0.5*x; % coefficients of the SDE
sigma = @(x) x;
Y = xi; % initial condition
for i = 1:N
    dW = W(i+1, :)-W(i, :); % increments of the M one-dimensional Brownian motions
    I = 1:M;
    J = 1:M;
    dW_sparse = sparse(I, J, dW);
    Y = Y + mu(Y)*Delta + sigma(Y)*dW_sparse; % M realizations of the EulerMaruyama approximation of X at t=i*Delta
end
end