% Record some interesting locations impulse response (local church, your
% bathroom/livingroom, lecture hall, guildroom...) (for
% example with you phone). Or you can use 'LoveLibrary.wav' from this
% folder.
% Import your IR to Matlab and exam it and use it to add
% reveberation to 'Guitar.wav'. Make sure that your IR and 'Guitar.wav' has
% the same sampling frequency by using resample() if neaded to convert your
% IRs samplerate.

% Write down what impulse response you used and how you got it.


%% Import audios and match samplerates
[A, A_fs] = audioread('LoveLibrary.wav');
A_info = audioinfo("LoveLibrary.wav");
[B, B_fs] = audioread('Guitar.wav');
B_info = audioinfo("Guitar.wav");

A = resample(A, B_fs, A_fs); % for matching sample rates
A_fs = B_fs;

%% IR Analysis
% Plot your IR
% Plot one sided magnitude and phase responses of you IR
% Analyse spectrums with couple of sentenses.
% You can smooth the the plot by lowpass filtering the responce
figure(1);
impz(A);
title('Impulse Response of LoveLibrary.wav');

figure(2);
freqz(A);
title('Magnitude & Phase Response of LoveLibrary.wav');

figure(3);
impz(B);
title('Impulse Response of Guitar.wav');

figure(4);
freqz(B);
title('Magnitude & Phase Response of Guitar.wav');

%% Adding Reverb
% Add reverberation to Guitar.wav by using convolution
soundsc(A, A_fs);
Reverberated = conv(B,A);
soundsc(Reverberated, A_fs)

figure(5);
impz(Reverberated);
title('Impulse Response of Reverberated Guitar.wav');
figure(6);
freqz(Reverberated);
title('Magnitude & Phase Response of Reverberated Guitar.wav');
