function y = myGenDTMF(seq)
% MYGENDTMF produces DTMF-audio vector, when it is given characterline
% "seq", which can include numbers 0,...,9 or space.

% Each number/space last at least 50ms.
% Sampling frequency is 8000Hz.

% DTMF-signals consist sum of two sinusoidal components
% tmp = cos(2*pi*f1*t) + cos(2*pi*f2*t)
% where lower frequencies are f1 = {697, 770, 852, 941} and 
% higher frequencies f2 = {1209, 1336, 1477}:
%
%	        1209 Hz 	1336 Hz 	1477 Hz
%   697 Hz 	1 	        2 	        3   	
%   770 Hz 	4 	        5         	6 
%   852 Hz 	7 	        8 	        9
%   941 Hz 	         	0 	        
%
% More info: 
% http://en.wikipedia.org/wiki/Dual-tone_multi-frequency_signaling
%

% Usage:
%  phonenum = '050 581 0518'
%  y  = myGenDTMF(phonemun);
%  soundsc(y, 8000);
%  figure(1); plot(y); xlabel('index number');
%  figure(2); spectrogram(y, 256, 128, 256, 8000, 'yaxis');
%

% Original task by:
% T-61.3015, harjoitustehtävä, 13.1.2012 / 2.2.2011
% Jukka Parviainen, jukka.parviainen@aalto.fi

fs  = 8000;                     % Sampling frequency
n   = (1 : 0.12*fs);            % time axels index values
N   = max(n);                   % indexes in 0.12 seconds
T   = 0.01*fs;                  % samples in 0.01 seconds
y   = zeros(N*length(seq)+T*length(seq),1); % set y-vector to 0
tmp = zeros(N,1);               % temp vector for 1 tone
k   = 1;                        % y-vector index 


for i = (1 : length(seq))
    switch seq(i)
        case '1' 
            fprintf(1,'Number 1\n');
            % generate sum of 2 sines that corresponds to button 1
            tmp = cos(2*pi*1209*n/fs) + cos(2*pi*697*n/fs);
            
        case '2'
            fprintf(1,'Number 2\n');
            tmp = cos(2*pi*1336*n/fs) + cos(2*pi*697*n/fs);
            
        case '3'
            fprintf(1,'Number 3\n');
            tmp = cos(2*pi*1477*n/fs) + cos(2*pi*697*n/fs);
            
        case '4'
            fprintf(1,'Number 4\n');
            tmp = cos(2*pi*1209*n/fs) + cos(2*pi*770*n/fs);
            
        case '5'
            fprintf(1,'Number 5\n');
            tmp = cos(2*pi*1336*n/fs) + cos(2*pi*770*n/fs);
            
        case '6'
            fprintf(1,'Number 6\n');
            tmp = cos(2*pi*1477*n/fs) + cos(2*pi*770*n/fs);
            
        case '7'
            fprintf(1,'Number 7\n');
            tmp = cos(2*pi*1209*n/fs) + cos(2*pi*852*n/fs);
            
        case '8'
            fprintf(1,'Number 8\n');
            tmp = cos(2*pi*1336*n/fs) + cos(2*pi*852*n/fs);

        case '9'
            fprintf(1,'Number 9\n');
            tmp = cos(2*pi*1477*n/fs) + cos(2*pi*852*n/fs);   
            
        case '0'
            fprintf(1,'Number 9\n');
            tmp = cos(2*pi*1336*n/fs) + cos(2*pi*941*n/fs);  
            
        case ' '
            fprintf(1,'Silent\n');
            tmp = zeros(N,1);
        otherwise
            fprintf(1,'Weird character: no can do :(\n');
    end
    % Insert audio clip to right place in y-vector:
    y(k+T : k+T+N-1) = tmp;
    % Increase y-vector index value
    k = k + N + T;
end