clc;
clear all;
close all;

%% Step 1: Import Training Audio Files
[audio_tin, fs_tin] = audioread("G:\DSP assignment\EXP 01\voice\Male\MINE_TEEN.opus");
[audio_chaar, fs_chaar] = audioread("G:\DSP assignment\EXP 01\voice\Male\MINE_CHAAR.opus");

% Resample training audio if sampling rates don't match
if fs_tin ~= fs_chaar
    target_fs = max(fs_tin, fs_chaar);
    audio_tin = resample(audio_tin, target_fs, fs_tin);
    audio_chaar = resample(audio_chaar, target_fs, fs_chaar);
    fs = target_fs;
else
    fs = fs_tin;
end

%% Step 2: Preprocess Training Audio
audio_tin = audio_tin / max(abs(audio_tin));
audio_chaar = audio_chaar / max(abs(audio_chaar));

%% Step 3: Compute FFT for Training Audio
N_tin = length(audio_tin);
fft_tin = fft(audio_tin);
fft_tin = fft_tin(1:floor(N_tin/2)+1);
freq_tin = (0:floor(N_tin/2)) * (fs / N_tin);
amp_tin = abs(fft_tin / N_tin) * 2;

N_chaar = length(audio_chaar);
fft_chaar = fft(audio_chaar);
fft_chaar = fft_chaar(1:floor(N_chaar/2)+1);
freq_chaar = (0:floor(N_chaar/2)) * (fs / N_chaar);
amp_chaar = abs(fft_chaar / N_chaar) * 2;

%% Step 4: Plot Frequency Spectrum for Training Data
figure;

subplot(2, 1, 1);
plot(freq_tin, amp_tin);
title('Frequency Spectrum of "tiin"');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0 2000]);

subplot(2, 1, 2);
plot(freq_chaar, amp_chaar);
title('Frequency Spectrum of "chaar"');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0 2000]);

%% Step 5: Extract Dominant Frequencies for Training
dominant_freqs_tiin = [174.621,357.179];  
dominant_freqs_chaar = [155.604,614.425,1230.53];  

%% Step 6: Import and Preprocess Test Signal
[test_audio, fs_test] = audioread("G:\DSP assignment\EXP 01\voice\Male\bro_TEEN.m4a");

if fs_test ~= fs
    test_audio = resample(test_audio, fs, fs_test);
end

test_audio = test_audio / max(abs(test_audio));

N_test = length(test_audio);
fft_test = fft(test_audio);
fft_test = fft_test(1:floor(N_test/2)+1);
freq_test = (0:floor(N_test/2)) * (fs / N_test);
amp_test = abs(fft_test / N_test) * 2;

%% Step 7: Extract Dominant Frequencies for Test Signal
[pks_test, locs_test] = findpeaks(amp_test, 'MinPeakHeight', 0.01, 'MinPeakDistance', 20);
dominant_freqs_test = freq_test(locs_test);

disp('Dominant frequencies in test signal:');
disp(dominant_freqs_test);
%% Step 7.1: Plot Frequency Spectrum of Test Signal
figure;
plot(freq_test, amp_test);
title('Frequency Spectrum of Test Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0 2000]);

%% Step 8: Classify the Test Signal
distance_to_tiin = sum(min(abs(dominant_freqs_test' - dominant_freqs_tiin), [], 2));
distance_to_chaar = sum(min(abs(dominant_freqs_test' - dominant_freqs_chaar), [], 2));

if distance_to_tiin < distance_to_chaar
    disp('The test signal is classified as "tiin".');
else
    disp('The test signal is classified as "chaar".');
end
