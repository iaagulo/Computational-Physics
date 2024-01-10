clear; clc;

fd = fopen('F:\referens.txt','r+');
a = fscanf(fd,'%g %g',[2 inf]);
fclose(fd);

t = a(1,:); y = a(2,:);
figure(1); plot(t,y)

f = 1000*( -length(t)/2+1:length(t)/2 )/2048;
Y = fft(y);
figure(2); plot(f,Y)
%size(t)
%size(y)