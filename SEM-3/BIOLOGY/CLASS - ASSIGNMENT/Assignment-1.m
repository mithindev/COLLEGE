% Load EEG signal data from file
eeg_data = load('C:\Users\sbara\Desktop\SEM-3\Bio Assignment\assignment_eeg_signal.mat');
eeg_signal = eeg_data.eeg_signal;  % Extract signal data from the loaded structure

% Define the sampling frequency
f = 1000;

% Question 1: Compute FFT of the EEG signal
fft_result = fft(eeg_signal);

% Compute Power Spectral Density (PSD)
psd = (abs(fft_result).^2) / (f * length(eeg_signal));

% Create a frequency vector
N = length(eeg_signal);
frequencies = (0:N-1) * (f / N);

% Question 2: Plot the PSD
figure;
plot(frequencies, 10*log10(psd));  
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('Power Spectral Density (PSD) of EEG Signal');
grid on;

% Question 3: Find Dominant Frequency
[max_power, index] = max(psd);
dominant = frequencies(index);
fprintf('Dominant Frequency: %.2f Hz\n', dominant);

% Question 4: Filter in the alpha band (8-13 Hz)
alpha_band = [8 13];
order = 4;  % Filter order 
[ba_alpha, aa_alpha] = butter(order, alpha_band / (f/2), 'bandpass');
filtered_alpha = filter(ba_alpha, aa_alpha, eeg_signal);

t = (0:length(eeg_signal)-1) / f;

% Plot the filtered EEG signal in the alpha band
figure;
plot(t, filtered_alpha);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered EEG Signal (Alpha Band)');
grid on;

% Question 5: Plot original EEG and filtered signal
figure;
subplot(2, 1, 1);
plot(t, eeg_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original EEG Signal');
grid on;

subplot(2, 1, 2);
plot(t, filtered_alpha);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered EEG Signal (Alpha Band)');
grid on;

% Question 6: Calculate power in alpha and beta bands
beta_band = [14 30];
[ba_beta, aa_beta] = butter(order, beta_band / (f/2), 'bandpass');
filtered_beta = filter(ba_beta, aa_beta, eeg_signal);
power_alpha = abs(filtered_alpha).^2;
power_beta = abs(filtered_beta).^2;
average_power_alpha = mean(power_alpha);
average_power_beta = mean(power_beta);

fprintf('Average power in the Alpha band (8-13 Hz): %.2f\n', average_power_alpha);
fprintf('Average power in the Beta band (14-30 Hz): %.2f\n', average_power_beta);

% Question 7: Detect peaks in EEG signal
threshold = 0.5;
[peaks, peak_indices] = findpeaks(eeg_signal, 'MinPeakHeight', threshold);
num_peaks = numel(peaks);
fprintf('Number of detected peaks: %d\n', num_peaks);

% Question 8: Correlation analysis
amplitude = max(abs(eeg_signal));
correlation_coefficient = corr(dominant, amplitude);
fprintf('Correlation coefficient between Dominant Frequency and Amplitude: %.4f\n', correlation_coefficient);
