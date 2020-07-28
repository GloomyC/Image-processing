clearvars
close all
clc

I = imread('lena.bmp');
I = imresize(I,[128,128])

subplot(2,3,1)
imshow(I)

I2 = imadjust(I,[],[0,31/255]);
I2 = imadjust(I2,[0,31/255],[]);
subplot(2,3,2)
imshow(I2)

I3 = imadjust(I,[],[0,15/255]);
I3 = imadjust(I3,[0,15/255],[]);
subplot(2,3,3)
imshow(I3)

I4 = imadjust(I,[],[0,7/255]);
I4 = imadjust(I4,[0,7/255],[]);
subplot(2,3,4)
imshow(I4)

I5 = imadjust(I,[],[0,3/255]);
I5 = imadjust(I5,[0,3/255],[]);
subplot(2,3,5)
imshow(I5)

I6 = imadjust(I,[],[0,1/255]);
I6 = imadjust(I6,[0,1/255],[]);
subplot(2,3,6)
imshow(I6)
