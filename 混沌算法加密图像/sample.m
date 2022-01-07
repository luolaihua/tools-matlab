t=-3*pi:pi/100:3*pi;
t1=-3*pi:pi/100:3*pi;
x=cos(t*2*pi);
y=sin(t*2*pi);
ft=sinc(t/pi);
plot3(x,y,ft);
grid on;