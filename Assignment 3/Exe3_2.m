function [A,b,a] = Exe3_2(A_mono,fs,fs_new)
% Replace all this. Return signal and the filter coefficients. Use low pass signal 
n = 6;

Wp = 0.7*(fs_new/2)/fs;
Rp = 2;
Rs = 30;
[b,a] = ellip(n,Rp,Rs,Wp,'low');

A = filter(b,a,A_mono);