function res = dtmf_decode(filename)
    [audio, Fs] = audioread(filename);
    f = [697 770 852 941 1209 1336 1477];
    y=f(1:4);
    x=f(5:end);
    audio = dtmf_filter(audio, Fs, 50);
    
    % Low sampling length might not get extra info to differentiate
    % frequencies.
    
    % High sampling length may lead to skipped silence pauses, overlapping
    % frequencies.
    
    % Choose wisely. For the given test set works between 0.38 and 0.12.
    sample_length = 0.012; 
        
    energy_threshold = sample_length*3500; % Chosen through trial and error
    N = round(Fs*sample_length);
    fi = round(f/Fs*N)+1;
    last='-';
    res='';
    
    while length(audio) > N
        sample = audio(1:N);
        audio = audio(N+1:end);
        dftm = abs(goertzel(sample, fi));
        [y_m, y_i] = max(dftm(1:4));
        [x_m, x_i] = max(dftm(5:end));
        if x_m > energy_threshold && y_m > energy_threshold
            if (last=='-')
                res = append(res, dtmf_decode_freq(x(x_i), y(y_i)));
            end
            last='1';
        else
            last='-';
        end
    end
end