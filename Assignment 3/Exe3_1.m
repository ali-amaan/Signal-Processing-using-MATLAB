function [a0 a1 a2 b0 b1 b2] = Exe3_1(fs, fc, G, Q)
    % Write your code here, replace all the variables.
    
    % Used the formula for calculating coefficients using the website:
    % https://webaudio.github.io/Audio-EQ-Cookbook/audio-eq-cookbook.html
    % In it, used the 'peakingEQ' formulas
    
    Wo = 2*pi*(fc/fs);
    alpha = sin(Wo)/(2*Q);
    A = 10 ^ (G/40);
    
    b0 = 1 + (alpha*A);
    b1 = -2 * cos(Wo);
    b2 = 1 - (alpha*A);
    
    a0 = 1 + (alpha/A);
    a1 = -2 * cos(Wo);
    a2 = 1 - (alpha/A);
end