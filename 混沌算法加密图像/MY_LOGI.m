%ªÏ„Á–Ú¡–Õº
clear;
clf;
u=2.6:0.001:4.0;
x=0.1;
for i=1:100
x=u.*(x-x.^2);
end
for j=1:100
x=u.*(x-x.^2);
plot(u,x,'k.','markersize',2)
hold on;
end
grid on
xlabel('\mu');
ylabel('x');
