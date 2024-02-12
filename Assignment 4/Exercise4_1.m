% Use windowed Fourier series method and design a FIR-type (causal) lowpass
% filter with cutoff frequency w_c = 3*pi/4.
% Impulse response of an ideal lowpass filter with cutoff frequency at w_c
% in matlab is w_c/pi*sinc(w_c/pi *n), where w_c = 2*pi*f_c/fs and 'n' is
% sample index.
clf;
fs = 8000;
n = (-70:70);
% h_d[n] = sin(3*pi/4*n) / (pi*n) = (3/4)*sinc(3/4*n)
h_d = 3/4*sinc(3/4*n);

figure(1)
stem(n,h_d)
title('Ideal IR')
grid on
%% Task a)
% generate 4th order FIR lowpass filter by windowing ideal impulse resonse with 
% rectangular window: w_r[n] = 1, -M =< n =< M, M = 2 and else 0. Plot the impulse 
% response and magnitude response

M = 2;

w_lowpass = zeros(1, length(n));
w_lowpass(n >= -M & n <= M) = 1;


% Windowed impulse response using H(n) = w(n) . h(n)
wir = w_lowpass .* h_d;

[wfr, f] = freqz(wir, 1, 512, fs);

wmr = abs(wfr);

% Plot in linear graph
figure(2); 
subplot(1, 2, 1)
plot(f, wmr)
hold on

speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off; grid on; title('Magnitude Response');

hold on
subplot(1, 2, 2)
stem(n, wir)
hold off; grid on; title('Impulse Response');

sgtitle('With Rectangular Window (M = 2)');

%% Task b)
% generate 4th order FIR lowpass filter by windowing ideal impulse resonse with 
% Hamming window: w_h[n] = 0.54+0.46*cos(pi*n/M), -M =< n =< M, M = 2. Plot the 
% impulse response and magnitude response

M = 2;
w_hamming = 0.54 + 0.46 * cos(pi * n / M);
w_hamming(n < -M & n > M) = 0;

% Hamming impulse response
wir_hamming = h_d .* w_hamming;

[wfr_hamming, f] = freqz(wir_hamming, 1, 512, fs);

wmr_hamming = abs(wfr_hamming);

% Plot in linear graph

figure(3)
subplot(1,2,1)
plot(f, wmr_hamming)
hold on

speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off; grid on; title('Magnitude Response')

hold on;
subplot(1,2,2)
stem(n, wir_hamming)
hold off; grid on; title('Amplitude Response');

sgtitle('With Hamming Window (M = 2)');

%% Task c)
% Compare how the magnitude responses of the filters designed in (a) and (b) 
% differ. Then do the same as in a) and b) but use filter order of 100 (M=50).

figure(4); 
subplot(1, 2, 1)
plot(f, wmr)
title('With Rectangular Window')
hold on
speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off; grid on;
subplot(1, 2, 2)
plot(f, wmr_hamming)
title('With Hamming Window')
hold on
speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off; grid on;

sgtitle('Magnitude Responses (M = 2)')


M = 50;

w_lowpass_50 = zeros(1, length(n));
w_lowpass_50(n >= -M & n <= M) = 1;
wir_50 = w_lowpass_50 .* h_d;
[wfr_50, f] = freqz(wir_50, 1, 512, fs);
wmr_50 = abs(wfr_50);

w_hamming_50 = 0.54 + 0.46 * cos(pi * n / M);
w_hamming_50(n < -M & n > M) = 0;
wir_hamming_50 = h_d .* w_hamming_50;
[wfr_hamming_50, f] = freqz(wir_hamming_50, 1, 512, fs);
wmr_hamming_50 = abs(wfr_hamming_50);

figure(5); 
subplot(1, 2, 1)
plot(f, wmr_50)
title('With Rectangular Window')
hold on
speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off; grid on;
subplot(1, 2, 2)
plot(f, wmr_hamming_50)
title('With Hamming Window')
hold on
speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off; grid on;

sgtitle('Magnitude Responses (M = 50)')
