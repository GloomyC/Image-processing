clearvars
close all
clc


I1 = imread('bart.bmp');

subplot(2,2,1)
imshow(I1)
subplot(2,2,2)
imhist(I1)

low = 190;
high = 220;

Ib = I1 > low & I1 < high;
Ib = uint8(Ib)*255;
subplot(2,2,3)
imshow(Ib)

