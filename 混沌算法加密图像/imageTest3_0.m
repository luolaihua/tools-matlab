%������ܵĽ��ܳ�������Ľ�����Կ���Ǽ�����Կ  
%ע�⣺ʹ�÷��������ܺͽ��ܵ��㷨��������ͼ�����ʱ������jpg��ʽ��ͼ����м��ܺ�  
%��д�룬���ڽ��ܳ����ж�����ܺ��jpg��ͼƬ��ͼƬ�Ჿ��ʧ�棬������bmp��ʽ��ͼ��  
%����д��Ͷ���ʱ�Ͳ���������������������jpg��ʽ��ͼ��������ѹ������Ȼ��ͬһ��  
%ͼ��д��Ͷ���������ͼ���RGBֵ�Ѿ���ͬ�ˣ�����෴bmp��ʽ��ͼ��������ѹ�������  
%������������������  
clear;  
RGBS1 = imread('���ܺ��aaa2.bmp', 'bmp');  
RGBS1 = imnoise(RGBS1, 'salt & pepper', 0.1);
s1 = size(RGBS1);  
N1 = s1(1) * s1(2) * s1(3);  
%m = 1:N;  
m1(1) = input('���������Կ�� ');  
disp('������...');  
figure(1);subplot(211);imshow(RGBS1);subplot(212);imhist(RGBS1)
for i1 = 1:N1-1  
    %�����������
    m1(i1+1) = 4 * m1(i1) - 4 * m1(i1)^2;  
end  
%RGBE = zeros(s(1), s(2), s(3));  
m1 = mod(m1 * 1000, 256);  
m1 = uint8(m1);  
n1 = 1;  
for i1 = 1:s1(3)  
    for j1 = 1:s1(2)  
        for k1 = 1:s1(1)  
            %���ﲻ��ʹ��RGBS1������jpg������ѹ����ʽ������Ͷ���������  
            %��ʹ�ü��ܺ�ûд��jpg��ʽʱ��RGB;  
            %RGBE(k1, j1, i1) = bitxor(m1(n1), RGBS1(k1, j1, i1));  
            RGBE(k1, j1, i1) = bitxor(m1(n1), RGBS1(k1, j1, i1));  
            n1 = n1 + 1;  
        end  
    end  
end  
disp('���ܳɹ�!');  
imwrite(RGBE, '���ܺ��bb2.jpg', 'jpg');  
figure(2);subplot(211); imshow(RGBE); title('���ܺ��ͼƬ'); subplot(212);imhist(RGBE) 