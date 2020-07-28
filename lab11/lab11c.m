clear;
clc;
close all;


I = imread('kolo.bmp');

If = fft2(I);

Ifs = fftshift(If);

InvFshift = ifftshift(Ifs);

I2 = ifft2(InvFshift);

subplot(1,2,1)
imshow(I)
title('oryginalny')
subplot(1,2,2)
imshow(I2)
title('z fouriera')




