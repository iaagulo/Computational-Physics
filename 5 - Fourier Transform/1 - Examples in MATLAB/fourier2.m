clear; clc; clf;

fd = fopen('F:\referens.txt','r+');
a = fscanf(fd,'%g %g',[2 inf]);
fclose(fd);
tr = a(1,:); yr = a(2,:);
%figure(1); plot(t,y)

fd = fopen('F:\data01.txt','r+');
b = fscanf(fd,'%g %g',[2 inf]);
fclose(fd);
t = b(1,:); y = b(2,:);
%figure(1); plot(t,y)

fr = 1000*( -length(tr)/2+1:length(tr)/2 )/2048;
Yr = fft(yr);
f = 1000*( -length(t)/2+1:length(t)/2 )/2048;
Y = fft(y);
hold on
plot(f,Y.*conj(Y),'k','LineWidth',1)
plot(fr,Yr.*conj(Yr),'r','LineWidth',2)
hold off
title('Reference and Data 1 (owned by allan)','FontSize',15);
ylabel('Intensity, Arb. Units', 'FontSize',15);
xlabel('Frequency, Hz', 'FontSize',15);

%w = exp(2*pi*i/length(y));
%for k = 1:length(y)
%    b = 0;
%    for n = 1:length(y)
%        b = b + y(n)*w^( (n-1)*(k-1) );
%    end;
%    Y1(k) = b;
%end;
%figure(3); plot(f,Y1.*conj(Y1))