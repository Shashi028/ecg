clc
clear all
close all
x=ecg(400);
hma8(1:8)=1/8;
y=sgolayfilt(x,0,15);
x=conv(y,hma8,'same');
x=repmat(x,1,4);
h0=[1 0 -1]
h1=[1 0 -2 0 1]
y0=abs(conv(x,h0,'same'));
y1=abs(conv(x,h1,'same'));
y2=(1.3*y0)+(1.1*y1);
y3=abs(conv(y2,hma8,'same'));
qrs=(y3>0.032);
subplot(611);
plot(x);
title('ECG');
subplot(612);
plot(y0);
subplot(613);
plot(y1);
subplot(614);
plot(y2);
subplot(615);
plot(y3);
subplot(616);
plot(x);
hold on
plot(qrs,'r')
figure;
plot(x.*qrs)