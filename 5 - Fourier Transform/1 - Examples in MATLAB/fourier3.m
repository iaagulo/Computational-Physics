clear; clc;

fd = fopen('F:\referens.txt','r+');
a = fscanf(fd,'%g %g',[2 inf]);
fclose(fd);

t = a(1,:); y = a(2,:);
figure(1); plot(t,y)

f = 1000*( -length(t)/2+1:length(t)/2 )/2048;
Y = fft(y);
figure(2); plot(f,Y)

k = 1:length(y); n = 1:length(y);
w = exp(2*pi*i/length(y));
for k = 1:length(y)
    for n = 1:length(y)
        W(n,k) = w^( (n-1)*(k-1) );
    end;
end;
Y1 = W*y;
figure(3); plot(f,Y1)