%ªÏ„Á–Ú¡–Õº
clear;
clf;
x=0.1;
a=4;
b=0.001:0.001:3.0;


for i=1:100
x = a.* x.^3 - b.*x;
end
for j=1:100
x = a.* x.^3 - b.*x;
plot(b,x,'k.','markersize',2)
hold on;
end
grid on
xlabel('b');
ylabel('x');
