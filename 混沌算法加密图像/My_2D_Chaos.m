%ªÏ„Á–Ú¡–Õº
clear;
%…Ë÷√≥ı÷µ---√ÿ‘ø
x = 0.1;
y = 0.1;
%…Ë÷√ªÏ„Á“Ú◊” u a b c
u=1.8;
a=0.001:0.001:4.0;
b=1;
c=1;

for i = 1:100  
    x = u.* y - c.* x.* y;
    y= a.* x.* x - b.* x;
end 

for j=1:100
x = u.* y - c.* x.* y;
y= a.* x.* x - b.* x;
plot(a,x,'k.','markersize',2)
hold on;
end
grid on
xlabel('a');
ylabel('x');
