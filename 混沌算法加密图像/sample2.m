x=-10:0.5:10;y=x';
X=ones(size(y))*x;
Y=y*ones(size(x));
R=sqrt(X.*X+Y.*Y); z=sin(R)./R;
subplot(211);
mesh(z);title('��ά��������')
 t=-30:0.01:30;
y1=sin(t)./t;
subplot(212);
plot(t,y1);title('��ά��������');grid on
