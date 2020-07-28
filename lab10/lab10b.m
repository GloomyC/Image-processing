clear;
clc;
close all;

I = imread('ccl2.png');
I2 = bwlabel(I,8);
I3 = bwlabel(I,4);

subplot(1,3,1)
imshow(I,[]);
subplot(1,3,2)
imshow(I2,[]);
subplot(1,3,3)
imshow(I3,[]);