clearvars
close all
clc


I1 = imread('tekstReczny.png');

I2 = movingMean(I1,0.5,20);

subplot(1,2,1)
imshow(I1)
subplot(1,2,2)
imshow(I2)