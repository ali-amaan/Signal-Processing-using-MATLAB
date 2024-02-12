function res = dtmf_decode_freq(freq1,freq2)
    freqSum = freq1 + freq2;
    switch freqSum
        case 1906
            res = '1';
        case 2033
            res = '2';
        case 2174
            res = '3';
        case 1979
            res = '4';
        case 2106
            res = '5';
        case 2247
            res = '6';
        case 2061
            res = '7';
        case 2188
            res = '8';
        case 2329
            res = '9';
        case 2277
            res = '0';
        otherwise
            res = '?';
    end
end

