function [A,b,a] = Exe3_2_filter(A_mono,fs,fs_new)
n = 6;

Wp = 0.7*(fs_new/2)/fs;
Rp = 2;
Rs = 30;
[b,a] = ellip(n,Rp,Rs,Wp,'low');

A = filter(b,a,A_mono);