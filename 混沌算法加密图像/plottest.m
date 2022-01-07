%»­Í¼
clc;
clear £»
fs=80;
t=-2:1/fs:2;
y1=sin(2*pi*t);
y2=cos(2*pi*t);
y3=1.2*sin(2*pi*140*t)+3.4*cos(2*pi*260*t);
subplot(311);
plot(t,y1);title('ÕıÏÒº¯Êı')
grid on;
subplot(312);
plot(t,y2);title('ÓàÏÒº¯Êı');
grid on;
subplot(313);
plot(t,y3);
grid on;