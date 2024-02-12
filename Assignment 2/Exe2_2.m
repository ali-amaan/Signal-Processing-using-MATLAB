function fft_exe = Exe2_2(IR, fs)
% Remove all of this
 fftransformed = fft(IR);
 fft_ans = abs(Exe2_1(fftransformed, 1));
 n = linspace(0,fs,length(fft_ans));
 figure(1); clf; % open/activate Fig. 1, clean it
 semilogx(n, fft_ans)
 grid on; xlabel('dB scale'); ylabel('Magnitude'); title('Frequency Response');
 fft_exe = fft_ans;
 

