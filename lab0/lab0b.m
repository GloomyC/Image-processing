clearvars
close all
 
I = imread('lena_gray.bmp');
 
[I2, map] = gray2ind(I,256);
 
imshow(I2,map)
 
map2 = colormap
 
figure
imshow(I2,map2)