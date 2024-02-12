%% ELEC-A6240 Computer Lab in Digital Signal Processing
% Excercise 2.1 

function dB = Exe2_1(signal, reference)
    dB = 20*log10(signal/reference);
    