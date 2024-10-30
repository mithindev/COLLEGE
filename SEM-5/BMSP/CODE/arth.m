% Step 1: Generate a clean signal (sinusoidal wave)
Fs = 1000;                % Sampling frequency (Hz)
t = 0:1/Fs:1;             % Time vector of 1 second
f = 5;                    % Frequency of the sinusoidal wave (Hz)
clean_signal = sin(2*pi*f*t); % Clean sinusoidal signal

% Step 2: Add Gaussian noise to the clean signal
noise = 0.4 * randn(size(t));  % Gaussian noise
noisy_signal = clean_signal + noise;  % Noisy signal

% Step 3: Perform wavelet decomposition using 'db4'
wavelet_type = 'db4';   % Wavelet name
level = 4;              % Decomposition level
[coeffs, l] = wavedec(noisy_signal, level, wavelet_type);

% Step 4: Set a universal threshold (e.g., based on noise level)
sigma = median(abs(coeffs)) / 0.6745;  % Estimate of noise standard deviation
threshold = sigma * sqrt(2 * log(length(noisy_signal)));  % Universal threshold

% Step 5: Apply hard thresholding
hard_coeffs = coeffs;                      % Initialize hard thresholded coefficients
hard_coeffs(abs(hard_coeffs) < threshold) = 0;  % Set coefficients below threshold to 0

% Step 6: Apply soft thresholding
soft_coeffs = sign(coeffs) .* max(abs(coeffs) - threshold, 0);  % Soft thresholding formula

% Step 7: Reconstruct the denoised signals using hard and soft thresholding
denoised_hard = waverec(hard_coeffs, l, wavelet_type);  % Reconstruct from hard thresholded coeffs
denoised_soft = waverec(soft_coeffs, l, wavelet_type);  % Reconstruct from soft thresholded coeffs

% Step 8: Plot the original, noisy, and denoised signals
figure;
subplot(3,1,1);
plot(t, clean_signal); 
title('Original Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, noisy_signal);
title('Noisy Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,3);
plot(t, denoised_hard, 'r', 'DisplayName', 'Hard Thresholding'); hold on;
plot(t, denoised_soft, 'g', 'DisplayName', 'Soft Thresholding'); hold off;
title('Denoised Signals');
legend;
xlabel('Time (s)'); ylabel('Amplitude');


%%
data_path = "C:\Users\mithin\Desktop\Biomedical_signal analysis\Project\apnea-ecg";  % Change this to your data path

signal_name = 'a04.dat';             % Exact name of the .dat file

% Verify if the file exists
full_file_path = fullfile(data_path, signal_name);
if exist(full_file_path, 'file') == 2
    disp('File exists, proceeding to open it.');
else
    error('File does not exist at the specified path.');
end

% Open the .dat file
fileID = fopen(full_file_path, 'r');

if fileID == -1
    error('Failed to open the file. Check permissions or path.');
else
    disp('File opened successfully.');
end