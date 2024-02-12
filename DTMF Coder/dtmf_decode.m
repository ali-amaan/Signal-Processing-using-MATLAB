function res = dtmf_decode(filename)
    [audio, Fs] = audioread(filename);
    f = [697 770 852 941 1209 1336 1477];
    y=f(1:4);
    x=f(5:end);
    audio = dtmf_filter(audio, Fs, 50);
    
    sample_length = 0.02;
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
        if x_m>80 && y_m>80
            if (last=='-')
                freqSum = x(x_i) + y(y_i);
                switch freqSum
                    case 1906
                        res = append(res,'1');
                    case 2033
                        res = append(res,'2');
                    case 2174
                        res = append(res,'3');
                    case 1979
                        res = append(res,'4');
                    case 2106
                        res = append(res,'5');
                    case 2247
                        res = append(res,'6');
                    case 2061
                        res = append(res,'7');
                    case 2188
                        res = append(res,'8');
                    case 2329
                        res = append(res,'9');
                    case 2277
                        res = append(res,'0');
                    otherwise
                        res = append(res,'?');
               end
            end
            last='1';
        elseif x_m<50 && y_m<50
            last='-';
        end
    end
end