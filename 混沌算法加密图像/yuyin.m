clc,close all
t0=cputime;

%image = imread('1.jpg');
image = imread('Lena.jpg');

[M,N]   = size(image);
Rm      = randsample(M,M)';%转成行向量
Rn      = randsample(N,N)';
