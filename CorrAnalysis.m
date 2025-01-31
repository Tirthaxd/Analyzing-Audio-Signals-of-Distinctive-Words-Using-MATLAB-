clc;
clear all;
close all;

%% Step 1: Load Voice Files
% Directly specify the file paths for the audio files

% Load 'tin' audio file
EEE_file ="G:\DSP assignment\EXP 01\voice\'EE' sound.opus";
[eee, Fs] = audioread(EEE_file);

% Load 'char' audio file
AAA_file ="G:\DSP assignment\EXP 01\voice\'AA'sound.opus";
[aaa, ~] = audioread(AAA_file);

% Load test audio file
test_file ="G:\DSP assignment\EXP 01\voice\Male\bro_CHAAR.m4a";
[test_signal, ~] = audioread(test_file);

%% Step 2: Preprocessing
% Normalize the signals
eee = eee / max(abs(eee));
aaa = aaa / max(abs(aaa));
test_signal = test_signal / max(abs(test_signal));

%% Step 3: Cross-Correlation
% Pad signals to the same length
max_length = max([length(test_signal), length(eee), length(aaa)]);
test_signal_padded = [test_signal; zeros(max_length - length(test_signal), 1)];
eee_padded = [eee; zeros(max_length - length(eee), 1)];
aaa_padded = [aaa; zeros(max_length - length(aaa), 1)];

% Compute cross-correlation with reference signals
[xcorr_eee, lags_eee] = xcorr(test_signal_padded, eee_padded, 'coeff'); % Normalized cross-correlation
[xcorr_aaa, lags_aaa] = xcorr(test_signal_padded, aaa_padded, 'coeff');

% Find maximum correlation values
[max_corr_eee, idx_eee] = max(xcorr_eee);
[max_corr_aaa, idx_aaa] = max(xcorr_aaa);

% Display results
disp(['Maximum Correlation with eee: ', num2str(max_corr_eee)]);
disp(['Maximum Correlation with aaa: ', num2str(max_corr_aaa)]);

%% Step 4: Plot Correlation Results
figure;
subplot(2, 1, 1);
plot(lags_eee, xcorr_eee);
title('Cross-Correlation with eee');
xlabel('Lag');
ylabel('Correlation');
grid on;

subplot(2, 1, 2);
plot(lags_aaa, xcorr_aaa);
title('Cross-Correlation with aaa');
xlabel('Lag');
ylabel('Correlation');
grid on;

%% Step 5: Classification
% Classify based on the higher correlation value
if max_corr_eee > max_corr_aaa
    disp('Predicted class: tin');
else
    disp('Predicted class: char');
end
