% Listen the audio file 'Noisy_speech.wav' and import it to Matlab.
% Filter the unwanted noises from it so that speech can be heard clearly.
% Plot spectrograms (time on x-axis) from original and filtered signals.
% Also plot magnitude responses, phase responses, impulse responses and
% zero-pole plots from all filters you used.

% Be careful not to filter out consonants characteric "high frequency noise" 
% so that all 's', 'k' and so on can be heard clearly.

[A, fs] = audioread('Noisy_speech.wav'); % Original Track
info = audioinfo("Noisy_speech.wav");
t = info.Duration;

figure(1);
pspectrum(A, fs, 'spectrogram');
title('Spectrogram of Unfiltered Noisy Speech')

% Filters Designed using filterDesigner Tool

% Filter 1: Order 10 IIR Butterworth Bandstop Filter
% Fs = 22050 Hz; Fc1 = 9900 Hz; Fc2 = 10100 Hz; 
[b1,a1] = sos2tf(SOS1_Bandstop_Butterworth);
figure(2); 
freqz(b1, a1); % Filter 1's Magnitude & Phase Response Plot
title('Magnitude & Phase Response of Bandstop Filter No.1');
figure(3);
subplot(2,1,1);
impz(b1, a1); % Filter 1's Impulse Response Plot
title('Impulse Response of Bandstop Filter No.1');
subplot(2,1,2);
zplane(b1, a1); % Filter 1's Zero-Pole Plot
title('Zero-Pole Plot of Bandstop Filter No.1');

A_filtered = filter(b1,a1,A);

% Filter 2: Order 10 IIR Butterworth Bandstop Filter
% Fs = 22050 Hz; Fc1 = 3200 Hz; Fc2 = 3400 Hz;
[b2,a2] = sos2tf(SOS2_Bandstop_Butterworth);
figure(4); 
freqz(b2, a2); % Filter 1's Magnitude & Phase Response Plot
title('Magnitude & Phase Response of Bandstop Filter No.2');
figure(5);
subplot(2,1,1);
impz(b2, a2); % Filter 1's Impulse Response Plot
title('Impulse Response of Bandstop Filter No.2');
subplot(2,1,2);
zplane(b2, a2); % Filter 1's Zero-Pole Plot
title('Zero-Pole Plot of Bandstop Filter No.2');

A_filtered = filter(b2,a2,A_filtered);
soundsc(A_filtered, fs)

figure(6);
pspectrum(A_filtered, fs, 'spectrogram');
title('Spectrogram of Filtered Noisy Speech')


