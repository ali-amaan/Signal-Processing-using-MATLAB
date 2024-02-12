% This exercise uses speksitIIR.m function from Mycourses. The function has
% to be in the same folder as this skript to work.
% You can write 'help speksitIIR' to  Command Window to get information
% about speksitIIR function. Sampling frequency in both sections is 48000Hz
% Use legend() to name each magnitude response clearly.
fs = 48000;
%% Task a)
% Design digital minimum order (lowest possible order) 
% I) Butterworth,
% II) Chebyshev 1,
% III) and Elliptic
% high-pass filters that fulfill specs drawn on the figure(1) and plot them
% to figure(1).
% Helpful functions: butter, buttord, cheb1, cheb1ord, ellip, ellipord
% freqz.

figure(1);clf
hold on
Wp = 0.5; Ws = 0.3; Rp = 3; Rs = 40; fs = 48000;

%plots here
[bOrder1, bWn] = buttord(Wp, Ws, Rp, Rs);
[bbutter,abutter] = butter(bOrder1, bWn,'high');
[h{1}, w{1}] = freqz(bbutter, abutter, [], fs); hold on;

[cOrder1, cWn] = cheb1ord(Wp, Ws, Rp, Rs);
[bcheby,acheby] = cheby1(cOrder1, Rp, cWn,'high');
[h{2}, w{2}] = freqz(bcheby, acheby, [], fs); hold on;

[eOrder1, eWn] = ellipord(Wp, Ws, Rp, Rs);
[bellip,aellip] = ellip(eOrder1, Rp, Rs, eWn,'high');
[h{3}, w{3}] = freqz(bellip, aellip, [], fs); hold on;


subplot(2,1,1)
hold on
for k = 1:3
    plot(w{k},20*log10(abs(h{k})))
end
speksitIIR(0.5, 0.3, 3, 40, 'high', 48000);
title('Magnitude Response')
legend('Butterworth','Chebyshev 1','Elliptic','Location','NorthEastOutside')
xlabel('Frequency / Hz')
ylabel('Magnitude / dB')
hold off
grid on
subplot(2,1,2)
hold on
for k = 1:3
    plot(w{k},unwrap(angle(h{k})))
end
title('Phase Response')
legend('Butterworth','Chebyshev 1','Elliptic','Location','NorthEastOutside')
xlabel('Frequency / Hz')
ylabel('Phase / degrees')
hold off
grid on

%% Task b)
% Design digital minimum order (lowest possible order) 
% I) Butterworth,
% II) Chebyshev 1,
% III) and Elliptic
% band-pass filters that fulfill specs drawn on the figure(2) and plot them
% to figure(2).
% Helpful functions: butter, buttord, cheb1, cheb1ord, ellip, ellipord
% freqz.

figure(2);clf
hold on

%plots here
fs = 48000; Wp = [0.5 0.7]; Ws = [0.3 0.8]; Rp = 1; Rs = 40;

%plots here
[bOrder2, bWn] = buttord(Wp, Ws, Rp, Rs);
[bbutter,abutter] = butter(bOrder2, bWn);
[h{1}, w{1}] = freqz(bbutter, abutter, [], fs); hold on;

[cOrder2, cWn] = cheb1ord(Wp, Ws, Rp, Rs);
[bcheby,acheby] = cheby1(cOrder2, Rp, cWn);
[h{2}, w{2}] = freqz(bcheby, acheby, [], fs); hold on;

[eOrder2, eWn] = ellipord(Wp, Ws, Rp, Rs);
[bellip,aellip] = ellip(eOrder2, Rp, Rs, eWn);
[h{3}, w{3}] = freqz(bellip, aellip, [], fs); hold on;


subplot(2,1,1)
hold on
for k = 1:3
    plot(w{k},20*log10(abs(h{k})))
end
speksitIIR([0.5 0.7], [0.3 0.8], 1, 40, '', 48000);
title('Magnitude Response')
legend('Butterworth','Chebyshev 1','Elliptic','Location','NorthEastOutside')
xlabel('Frequency / Hz')
ylabel('Magnitude / dB')
hold off
grid on
subplot(2,1,2)
hold on
for k = 1:3
    plot(w{k},unwrap(angle(h{k})))
end
title('Phase Response')
legend('Butterworth','Chebyshev 1','Elliptic','Location','NorthEastOutside')
xlabel('Frequency / Hz')
ylabel('Phase / degrees')
hold off
grid on

%% Task c)
% What are the orders of each filters and what differences: butterworth,
% chebyshev 1 and elliptic filter have?
bOrder1
bOrder2
cOrder1
cOrder2
eOrder1
eOrder2












