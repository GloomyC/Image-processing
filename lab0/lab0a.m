clearvars
close all
 
%5
imfinfo('lena.bmp')
imfinfo('lena.jpg')
 
%6
I = imread('lena.bmp');
I2 = imread('lena.jpg');
 
imshow(I);
figure()
imshow(I2);
 
%7
lenaGray = rgb2gray(I);
figure()
imshow(lenaGray);
 
%8
imwrite(lenaGray, 'lena_gray.bmp');
 
%9
colormap gray
figure
mesh(lenaGray);
 
figure
plot(lenaGray(10,:));
 
 