function sig = Exe3_3(M)

% Write your code here.
sig = M.signal1;
t = M.time;
fT = M.fT;
dt = 1/fT;
Fs = fT;
N = length(sig);
time = [0:N-1]/Fs;

% Signal Pre-Filtering
sig_fft = abs(fft(sig));
f = linspace(0,Fs, length(sig_fft));
figure(1); plot(f, (sig_fft)); ylabel('dB'); xlabel('frequency (Hz)');
xlim([0 Fs/2]); title("FFT Response Before Filtering");

% filter
[b,a] = butter(2,[0.05*2/Fs 75*2/Fs]);
h = fvtool(b, a); % Filter Response Plot

% Signal Post-Filtering
filtered_sig = filter(b, a, sig);
figure(2); plot(f,abs(fft(filtered_sig)));
xlim([0, Fs/2]); title("FFT Response After Filtering");

% ECG
figure(3); plot(t, sig); hold on; plot([0:(N/8)-1]/(Fs/8), downsample(filtered_sig,8));
xlabel('Time/s'); ylabel('Magnitude/V'); xlim([15 20]); title("ECG");


