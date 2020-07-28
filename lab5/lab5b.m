clearvars
close all
clc

I1 = imread('lenaSzum.bmp');

I2 = medfilt2(I1);

h = fspecial('average', 3);
I3 = conv2( I1, h, 'same');
I3 = uint8(I3);

subplot(2,3,1)
imshow(I1)
subplot(2,3,2)
imshow(I2)
subplot(2,3,3)
imshow(I3)
subplot(2,3,5)
imshow(imabsdiff(I1,I2),[])
subplot(2,3,6)
imshow(imabsdiff(I1,I3),[])

figure
I5 = I1;
for i =1:10
    I5 = medfilt2(I5,[5,5]);
end

subplot(1,2,1)
imshow(I1)
subplot(1,2,2)
imshow(I5)




