% Generate time vector
t = linspace(0, 2*pi, 512);
% Generate signal
signal = sin(t);
% Introduce noise with a given standard deviation
sigma = 0.1;
noise = sigma * randn(size(signal));
% Create a noisy signal
y = signal + noise;
N = length(y);
% Create a vector of ones
e = ones(N, 1);
% Create a sparse matrix for finite difference operation
D = spdiags([e, -2*e, e], 0:2, N-2, N);
% Set regularization parameter
lambda = 50;

% Solve the denoising problem using convex optimization (CVX)
cvx_begin quiet
    variable x(N)
    minimize(norm(y - x) + lambda * norm(D * x, 2))
cvx_end

% Plotting
figure;
subplot(3, 1, 1);
plot(y);
title('Noisy Signal');
axis tight;
ylabel('Amplitude');

subplot(3, 1, 2);
plot(x);
title('Denoised Signal');
axis tight;
xlabel('Samples');

subplot(3, 1, 3);
plot(signal);
title('Original Signal');
axis tight;
xlabel('Samples');
