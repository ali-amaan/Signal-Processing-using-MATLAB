% One can hear dual tone multi frequency (DTMF) signal
% e.g. in traditional phone or mobile phone when number buttons are pressed. DTFM
% signals are sum of two sine components; lower and higher.
% x[n] = cos(2pi(f1/fT )n) + cos(2pi(f2/fT )n),
% lower frequencies {697, 770, 852, 941} 
% higher frequencies {1209, 1336, 1477}.

%          1209 Hz  1336 Hz  1477 Hz
%  697 Hz    1        2         3
%  770 Hz    4        5         6
%  852 Hz    7        8         9
%  941 Hz             0

% Implement function that takes phone number as a string and returns DTMF vector.
% Check file myGenDTMF.m in MyCourses and write the missing rows in switch-case struc-
% ture. Make sure that your code works! Return your source code and
% spectrogram of your signal.
phonenmbr = '050 581 0518'
y = myGenDTMF(phonenmbr);
soundsc(y, 8000);
figure(1)
plot(y);
figure(2)
spectrogram(y,254,'yaxis')
