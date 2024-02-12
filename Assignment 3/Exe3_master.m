%% Exercise 3 master
clear all;
close all;
%% Exercise 3_1 Notch filter coeff calculator

fs = 44100; % fs 44.1 kHz
G = 5; %5 dB of gain
Q = 2;% Q value of the filter
fc = 1000; % Center Frequency

fs2 = 44100; % fs 44.1 kHz
G2 = -12; %5 dB of gain
Q2 = 1;% Q value of the filter
fc2 = 15000; % Center Frequency 


[a0 a1 a2 b0 b1 b2] =  Exe3_1(fs, fc, G, Q);
[a0_2 a1_2 a2_2 b0_2 b1_2 b2_2] =  Exe3_1(fs2, fc2, G2, Q2);
%% Exercise 3_2 

ds_coeff = 2;
[A fs] = audioread('Exe3_2track.wav'); % Original Track
[A_ds fs_ds] = audioread('Exe3_2track_ds2.wav'); %Downsampled track
A_mono = A(:,1);
A_mono_ds = A_ds(:,1);

figure(1); plot(20*log10(abs(fft(A_mono)))); title("FFT Response of Audio Signal Before Filtering");

[A_mono, b ,a] = Exe3_2(A_mono,fs,fs_ds); % Calculate your filters and make the filters here

%soundsc(A_mono,fs); % Listen Original signal here
%soundsc(A_mono_ds,fs_ds); Listen filtered signal here
figure(2); freqz(b,a); title("Filter Magnitude & Phase Response") % Plotting the filter magnitude and phase response.
figure(3); plot(20*log10(abs(fft(A_mono)))); title("FFT Response of Audio Signal After Filtering");

%% Exercise 3_3

% Produce an fft of existing ECG data, filter the data and extract pulse from  

M = load('data.mat');
sig = Exe3_3(M);
