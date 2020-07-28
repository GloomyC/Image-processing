clearvars
close all
clc

load funkcjeLUT;
plot(kwadratowa)

subplot(2,2,1)
I = imread('lena.bmp');
imshow(I)
subplot(2,2,2)
I2 = intlut(I,kwadratowa);
imshow(I2)
