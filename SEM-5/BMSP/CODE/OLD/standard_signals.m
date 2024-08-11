% standard-signals.m


% Unit Impulse Signal (Delta Function)
clc; clear; close all;

t = -10:10; % Time vector
delta = (t == 0); % Delta function
stem(t, delta); % Plotting
title('Unit Impulse Signal');
xlabel('Time');
ylabel('Amplitude');

%%
%Unit Step Signal
clc; clear; close all;

t = -10:10; % Time vector
step = (t >= 0); % Step function
stem(t, step); % Plotting
title('Unit Step Signal');
xlabel('Time');
ylabel('Amplitude');

%%
clc; clear; close all;

% Ramp Signal

t = -10:10; % Time vector
ramp = t .* (t >= 0); % Ramp function
stem(t, ramp); % Plotting
title('Ramp Signal');
xlabel('Time');
ylabel('Amplitude');

%%
clc; clear; close all;

% Exponential Signal

t = -10:0.1:10; % Time vector
a = 1; % Exponential growth rate
exp_signal = exp(a * t); % Exponential function
plot(t, exp_signal); % Plotting
title('Exponential Signal');
xlabel('Time');
ylabel('Amplitude');

%%
clc; clear; close all;

% Sinusoidal Signal

t = 0:0.01:1; % Time vector
A = 1; % Amplitude
f = 5; % Frequency in Hz
phi = 0; % Phase in radians
sinusoid = A * sin(2 * pi * f * t + phi); % Sinusoidal function
plot(t, sinusoid); % Plotting
title('Sinusoidal Signal');
xlabel('Time');
ylabel('Amplitude');

%%
clc; clear; close all;
% Time vector
t = 0:0.01:10; % From 0 to 10 seconds with a step of 0.01 seconds

% Exponential decay rate
a = 1; % You can change this value to see different rates of decay

% Falling exponential function
falling_exp_signal = exp(-a * t);

% Plotting the signal
plot(t, falling_exp_signal);
title('Falling Exponential Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;



