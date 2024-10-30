```% Step 1: Generate a clean signal (sinusoidal wave)
Fs = 1000;                % Sampling frequency (Hz)
t = 0:1/Fs:1;             % Time vector of 1 second
f = 5;                    % Frequency of the sinusoidal wave (Hz)
clean_signal = sin(2*pi*f*t); % Clean sinusoidal signal

% Step 2: Add Gaussian noise to the clean signal
noise = 0.4 * randn(size(t));  % Gaussian noise
noisy_signal = clean_signal + noise;  % Noisy signal

% Step 3: Perform wavelet decomposition using 'db4' and 'db10'
wavelet_type1 = 'db4';  % Wavelet name
wavelet_type2 = 'db10'; % Second wavelet name

% Decompose signal to 4 levels
[coeffs_db4, l_db4] = wavedec(noisy_signal, 4, wavelet_type1);
[coeffs_db10, l_db10] = wavedec(noisy_signal, 4, wavelet_type2);

% Step 4: Denoising by zeroing out detail coefficients at each level (db4)
denoised_db4 = noisy_signal;  % Initialize for plotting comparison
denoised_db10 = noisy_signal; % Initialize for plotting comparison

for level = 1:4
    % Zero out detail coefficients at each level for db4
    denoised_coeffs_db4 = coeffs_db4;
    denoised_coeffs_db4(sum(l_db4(1:level))+1:end) = 0; % Zero out details after level

    % Zero out detail coefficients at each level for db10
    denoised_coeffs_db10 = coeffs_db10;
    denoised_coeffs_db10(sum(l_db10(1:level))+1:end) = 0; % Zero out details after level

    % Step 5: Reconstruct signal after denoising (for both wavelets)
    denoised_db4 = waverec(denoised_coeffs_db4, l_db4, wavelet_type1);
    denoised_db10 = waverec(denoised_coeffs_db10, l_db10, wavelet_type2);
    
    % Plot comparison at each level
    figure;
    subplot(3,1,1); plot(t, clean_signal); title('Original Signal'); xlabel('Time (s)'); ylabel('Amplitude');
    subplot(3,1,2); plot(t, noisy_signal); title('Noisy Signal'); xlabel('Time (s)'); ylabel('Amplitude');
    subplot(3,1,3); plot(t, denoised_db4); title(['Denoised Signal (db4) - Level ', num2str(level)]); xlabel('Time (s)'); ylabel('Amplitude');
    
    % Plot db10 version
    figure;
    subplot(3,1,1); plot(t, clean_signal); title('Original Signal'); xlabel('Time (s)'); ylabel('Amplitude');
    subplot(3,1,2); plot(t, noisy_signal); title('Noisy Signal'); xlabel('Time (s)'); ylabel('Amplitude');
    subplot(3,1,3); plot(t, denoised_db10); title(['Denoised Signal (db10) - Level ', num2str(level)]); xlabel('Time (s)'); ylabel('Amplitude');
    
end
































%%


