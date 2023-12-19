%% This program plots the sine function
clear; clc; clf;

f = 30;               % in Hertz
range = 2*pi;
t = -range:1/(30*100):range; % in seconds

w = 2*pi*f;
ysin = sin(w*t); 
ycos = cos(w*t);

figure(1);
plot(t,ysin,'LineWidth',3);
hold on;
plot(t,ycos,'r','LineWidth',3);
hold off;