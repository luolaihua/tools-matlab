% 利用极坐标画半球体
phi=0:pi/50:pi*2;
theta=0:pi/50:2*pi;
r=0:0.01:1;
[pp,tt,rr]=meshgrid(phi,theta,r);
x=rr.*cos(tt);
y=rr.*sin(tt);
z=rr.*rr;
figure(1)
mesh(x,y,z);
figure(2)
plot3(x,y,z)
hold on;
