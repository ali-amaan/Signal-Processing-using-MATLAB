% Write your own downBy2 and upBy2 function at the end of the script and
% learn how to use them.
clf;
%% Task a)
% Read audio file 'Guitar.wav' to Matlab and confirm that its
% sampling frequency is 48000 Hz.
[A, A_fs] = audioread('Guitar.wav'); % Guitar Track
info = audioinfo("Guitar.wav");
A_fs;

figure(1);
impz(A); xlim([9881 10050]);
title('Impulse Response of Guitar.wav');

% Confirmed that sampling frequency, fs == 48000 Hz.

%% Task b)
% Write a 'downsampling by 2' function without using Matlabs own 
% downsampling functions.
% This is done by first filtering the signal with lowpass filter with
% cutoff frequency at fs/4 and then taking every other sample.

% Then downsample 'Guitar.wav' with it and plot it (samples in  x axis)
% and listen it so that it looks/sound correct (should sound and look like
% original signal but has half to amount of samples).
% Sampling frequency should be now 24000 Hz.
% Plot the magnitude and phase response of the filter you use in the downsampling.

soundsc(A, A_fs);
[A_ds, A_ds_fs] = downBy2(A, A_fs);
figure(3);
impz(A_ds); xlim([4944 5029]);
title('Downsampled Impulse Response of Guitar.wav');
soundsc(A_ds, A_ds_fs);


%% Task c)
% Write a 'upsampling by 2' function without using Matlabs build in
% upsampling functions. 
% This can be done by first adding 0 between every sample and then
% filtering the signal with a lowpass filter with cutoff frequency at
% fs_new/4.

% Then upsample the down sampled signal in part (a) with it and plot it 
% (samples in x axis) and listen it so that it looks/sound correct (should 
% sound and look like original signal).
% Sampling frequency should be at the end 48000 Hz.
% Plot the magnitude and phase response of the filter you use in the upsampling.

soundsc(A, A_fs);
[A_up, A_up_fs] = upBy2(A_ds, A_ds_fs);
figure(5);
impz(A_up); xlim([9896 10066]);
title('Upsampled Impulse Response of Guitar.wav');
soundsc(A_up, A_up_fs);


%% Functions

% [y, fs_y] = downBy2(x,fs);
% x    = input signal
% fs   = input signals original sampling frequency
% xd2  = x downsampled by 2
% fs_y = correct sampling frequency for y
function [y, fs_y] = downBy2(x,fs)
    [b, a] = butter(10, (fs/4)/fs, "low");
    figure(2);
    freqz(b, a);
    title('Magnitude & Phase Response of Low Pass Filter used in Downsampling')
    
    x_filtered = filter(b, a, x);
    
    y = x_filtered(1:2:end);
    fs_y = fs/2;
end 


% [y, fs_y] = upBy2(x,fs);
% x     = input signal
% fs    = input signals original sampling frequency
% y     = x upsampled by 2
% fs_y  = correct sampling frequency for y
function [y,fs_y] = upBy2(x,fs)
    x_up = zeros([1 length(x)*2]);
    x_up(1:2:end) = x;

    [b, a] = butter(10, (fs/4)/fs, "low");
    figure(4);
    freqz(b, a);
    title('Magnitude & Phase Response of Low Pass Filter used in Upsampling')

    y = filter(b, a, x_up);
    fs_y = fs * 2;
end 