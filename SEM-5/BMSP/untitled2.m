% Parameters
Fs = 1000;            % Sampling frequency (Hz)
N1 = 512;             % Number of samples
N2 = 1000;            % Number of samples for the second part
N3 = 200;             % Number of samples for the third part
t1 = (0:N1-1)/Fs;     % Time vector for N = 512 samples
t2 = (0:N2-1)/Fs;     % Time vector for N = 1000 samples
t3 = (0:N3-1)/Fs;     % Time vector for N = 200 samples
f1 = 200;             % Frequency of the first sine wave (Hz)
f2 = 400;             % Frequency of the second sine wave (Hz)

% Generate the clean signal (sum of two sinusoids)
signal_clean1 = sin(2*pi*f1*t1) + sin(2*pi*f2*t1);
signal_clean2 = sin(2*pi*f1*t2) + sin(2*pi*f2*t2);
signal_clean3 = sin(2*pi*f1*t3) + sin(2*pi*f2*t3);

% Define the SNR levels
SNR_values = [-8, -4, -16]; % SNR in dB

% Function to add noise to the signal and compute the FFT
function magnitude_spectrum = add_noise_and_compute_fft(signal, N, Fs, SNR)
    % Calculate the signal power
    signal_power = rms(signal)^2;
    
    % Calculate the noise power based on the desired SNR
    noise_power = signal_power / (10^(SNR/10));
    
    % Generate white Gaussian noise
    noise = sqrt(noise_power) * randn(size(signal));
    
    % Add noise to the signal
    noisy_signal = signal + noise;
    
    % Compute the FFT of the noisy signal
    signal_fft = fft(noisy_signal);
    
    % Compute the magnitude spectrum
    magnitude_spectrum = abs(signal_fft/N);
    magnitude_spectrum = magnitude_spectrum(1:N/2+1);
end

% Create a figure for side-by-side plots
figure;

% Plot for different SNR values with N = 512 samples
for i = 1:length(SNR_values)
    subplot(3, 3, i);
    mag_spectrum = add_noise_and_compute_fft(signal_clean1, N1, Fs, SNR_values(i));
    f = Fs*(0:(N1/2))/N1;  % Frequency vector
    plot(f, mag_spectrum);
    title(['SNR = ', num2str(SNR_values(i)), ' dB, N = ', num2str(N1)]);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
end

% Plot for different values of N with SNR = -8 dB
N_values = [N2, N3];
for j = 1:length(N_values)
    subplot(3, 3, 3 + j);
    mag_spectrum = add_noise_and_compute_fft(signal_clean2, N_values(j), Fs, -8);
    f = Fs*(0:(N_values(j)/2))/N_values(j);  % Frequency vector
    plot(f, mag_spectrum);
    title(['SNR = -8 dB, N = ', num2str(N_values(j))]);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
end
