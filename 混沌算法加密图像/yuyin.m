clc,close all
t0=cputime;

%image = imread('1.jpg');
image = imread('Lena.jpg');

[M,N]   = size(image);
Rm      = randsample(M,M)';%ת��������
Rn      = randsample(N,N)';
