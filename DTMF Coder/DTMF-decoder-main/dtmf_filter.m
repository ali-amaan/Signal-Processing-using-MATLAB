function res = dtmf_filter(audio, Fs, bw)
    frequencies = [697 770 852 941 1209 1336 1477];
    res = zeros(length(audio), 1);
    for f = frequencies
        [b,a] = iirpeak(f/(Fs/2), bw/(Fs/2));
        add = filter(b, a, audio);
        res = res + add;
    end
    res = normalize(res);
end

