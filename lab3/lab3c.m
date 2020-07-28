clearvars
close all
clc

%I1 = imread('lenaRGB.bmp');
I1 = imread('jezioro.jpg');

R = I1(:,:,1);
G = I1(:,:,2);
B = I1(:,:,3);

subplot(1,3,1)
imhist(R)
subplot(1,3,2)
imhist(G)
subplot(1,3,3)
imhist(B)

Req = histeq(R,256);
Beq = histeq(B,256);
Geq = histeq(G,256);

I2 = I1;
I2(:,:,1)=Req;
I2(:,:,2)=Beq;
I2(:,:,3)=Geq;

figure
subplot(2,2,1)
imshow(I1)
subplot(2,2,2)
imshow(I2)

I3 = rgb2hsv(I1);

H = I3(:,:,1);
S = I3(:,:,2);
V = I3(:,:,3);

Veq = histeq(V,256);

I3(:,:,3) = Veq;

I3 = hsv2rgb(I3);

subplot(2,2,3)
imshow(I3)

figure
subplot(1,3,1)
imhist(H)
subplot(1,3,2)
imhist(S)
subplot(1,3,3)
imhist(V)







