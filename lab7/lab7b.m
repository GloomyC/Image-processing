clearvars
close all
clc

I = imread('fingerprint.bmp');
I1 = bwmorph(I,'thin',1);
I2 = bwmorph(I,'thin',2);
Iinf = bwmorph(I,'thin',inf);

subplot(1,4,1)
imshow(I);
subplot(1,4,2)
imshow(I1);
subplot(1,4,3)
imshow(I2);
subplot(1,4,4)
imshow(Iinf);

figure
I = imread('kosc.bmp');
Iskele = bwmorph(I,'skel',inf);

subplot(1,2,1)
imshow(I);
subplot(1,2,2)
imshow(Iskele);

figure
I = imread('text.bmp');
SE = ones(51,1);
Ierodet = imerode(I,SE);
Idetect = imdilate(Ierodet,SE);
Ire = imreconstruct(Ierodet,I);
Ifill = imfill(I,'holes');
Iclean = imclearborder(I);

subplot(3,2,1)
imshow(I);
subplot(3,2,2)
imshow(Idetect);
subplot(3,2,3)
imshow(Ire);
subplot(3,2,4)
imshow(Ifill);
subplot(3,2,5)
imshow(Iclean);



