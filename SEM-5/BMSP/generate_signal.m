function [signal, noisy_signal] = generate_signal(freq, SNR, noise_type, N)
    % Generate a signal with the given frequency and number of samples
    % Parameters:
    % freq: Signal frequency in Hz
    % SNR: Signal-to-noise ratio in dB
    % noise_type: Type of noise ('uniform' or 'gaussian')
    % N: Number of samples
    
    % Sampling parameters
    fs = 2 * freq; % Sampling frequency, at least twice the signal frequency (Nyquist rate)
    t = (0:N-1)/fs; % Time vector
    
    % Generate the clean signal (sine wave)
    signal = sin(2 * pi * freq * t);
    
    % Calculate signal power
    signal_power = var(signal);
    
    % Calculate noise power based on SNR
    noise_power = signal_power / (10^(SNR/10));
    
    % Generate noise based on the specified type
    if strcmpi(noise_type, 'uniform')
        noise = sqrt(12 * noise_power) * (rand(1, N) - 0.5); % White uniform noise
    elseif strcmpi(noise_type, 'gaussian')
        noise = sqrt(noise_power) * randn(1, N); % Gaussian noise
    else
        error('Invalid noise type. Choose either ''uniform'' or ''gaussian''.');
    end
    
    % Add noise to the signal
    noisy_signal = signal + noise;
    
    % Plot the clean and noisy signals
    figure;
    subplot(2,1,1);
    plot(t, signal);
    title('Clean Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');
    
    subplot(2,1,2);
    plot(t, noisy_signal);
    title(['Noisy Signal with ' noise_type ' noise, SNR = ' num2str(SNR) ' dB']);
    xlabel('Time (s)');
    ylabel('Amplitude');
end

clc; clear; close all;

% Parameters
freq = 10; % Signal frequency in Hz
SNR = 20; % Signal-to-noise ratio in dB
noise_type = 'gaussian'; % Type of noise ('uniform' or 'gaussian')
N = 1000; % Number of samples

% Generate and plot the signals
[signal, noisy_signal] = generate_signal(freq, SNR, noise_type, N);
