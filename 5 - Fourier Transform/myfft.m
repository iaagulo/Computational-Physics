function [f, yfft] = myfft(y, Fs)
    L = length(y);
    yfft = fft(y);
    yfft = yfft(1:ceil(L/2));
    f = Fs*(0:L/2)/L;
end