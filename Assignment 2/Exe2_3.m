%% %% ELEC-A6240 Computer Lab in Digital Signal Processing
% Excercise 2.3

% This time you have to create a fft from .mat file data. You can plot the
% data to visualize and reason what kind of data you would like to see

function fft1 = Exe2_3(filename)

% First 3 rows are correct replace the rest and produce 
    M = load(filename);
    Fs = M.fT;
    t = M.time;
    
    beat1 = M.signal1(81000:82000);
    figure(2); clf; % open/activate Fig. 1, clean it
    plot(t, M.signal1)
    %semilogx(Fs, Exe2_1(abs(fft(beat1)), 1))
    grid on; xlabel('Time'); ylabel('Magnitude'); 
    xlim([100 110]);
    title('Time Domain');
    
    figure(3); clf; % open/activate Fig. 1, clean it
    semilogx(Exe2_1(abs(fft(beat1)), 1))
    grid on; xlabel('Frequency'); ylabel('Magnitude'); 
    xlim([0 5000]);
    title('Frequency Domain');
    
    fft1 = abs(Exe2_1(fft(M.signal1), 1));
end
   
    