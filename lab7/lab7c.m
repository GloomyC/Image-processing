clearvars
close all
clc

I = imread('ferrari.bmp');
SE = strel('rectangle',[3, 3]);
Idyl = imdilate(I,SE);
Ier = imerode(I,SE);
Iboth = imerode(Idyl,SE);
Itop = imtophat(I,SE);
Ibot = imbothat(I,SE);

subplot(2,3,1)
imshow(I);
subplot(2,3,2)
imshow(Idyl);
subplot(2,3,3)
imshow(Ier);
subplot(2,3,4)
imshow(Iboth);
subplot(2,3,5)
imshow(Itop);
subplot(2,3,6)
imshow(Ibot);

figure
I = imread('rice.png');
SE = strel('disk',10);
Itop = imtophat(I,SE);

subplot(1,2,1)
imshow(I);
subplot(1,2,2)
imshow(Itop);


