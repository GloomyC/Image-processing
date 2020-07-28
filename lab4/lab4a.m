clearvars
close all
clc



I1 = imread('coins.png');
%I1 = imread('rice.png');
%I1 = imread('tekst.bmp');
%I1 = imread('obiekty.bmp');
%I1 = imread('katalog.bmp');
subplot(2,2,1)
imshow(I1)
subplot(2,2,2)
imhist(I1)
mythresh = 80;
I2 = im2bw(I1,mythresh/255);
subplot(2,2,3)
imshow(I2)

figure

I3 = imread('figura.png');
subplot(2,2,1)
imhist(I3)
I4 = imread('figura2.png');
subplot(2,2,2)
imhist(I4)
I5 = imread('figura3.png');
subplot(2,2,3)
imhist(I5)
I6 = imread('figura4.png');
subplot(2,2,4)
imhist(I6)

figure

subplot(3,2,1)
imshow(I1)
subplot(3,2,2)
imhist(I1)
thresh = graythresh(I1);
Iotsu = im2bw(I1,thresh);
subplot(3,2,3)
imshow(I2)
title(strcat("moje ",num2str(mythresh)))
subplot(3,2,4)
imshow(Iotsu)
title(strcat("iotsu ",num2str(thresh*255)))
thresh = clusterKittler(I1)
Ikittler = im2bw(I1,thresh/255);
subplot(3,2,5)
imshow(Ikittler)
title(strcat("kittler ",num2str(thresh)))
thresh = entropyYen(I1)
Iyen = im2bw(I1,thresh/255);
subplot(3,2,6)
imshow(Iyen)
title(strcat("yen ",num2str(thresh)))



