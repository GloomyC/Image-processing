clearvars
close all
clc

I = imread('ertka.bmp');
SE = strel('rectangle',[3, 3]);
Ieroded = imerode(I,SE);
%Ieroded = imerode(Ieroded,SE);
%Ieroded = imerode(Ieroded,SE);
Idilated = imdilate(I,SE);
SE = strel('sphere', 3);
Ifixed = imdilate(Ieroded,SE);

subplot(1,4,1)
imshow(I);
subplot(1,4,2)
imshow(Ieroded);
subplot(1,4,3)
imshow(Idilated);
subplot(1,4,4)
imshow(Ifixed);


figure
I = imread('buzka.bmp');
Left = strel('arbitrary',[1,0,0;0,1,0;0,0,1]);
Right = strel('arbitrary',[0,0,1;0,1,0;1,0,0]);
Il = imerode(I,Left);
Ir = imerode(I,Right);

subplot(1,3,1)
imshow(I);
subplot(1,3,2)
imshow(Il);
subplot(1,3,3)
imshow(Ir);

figure
I = imread('hom.bmp');
SE = strel('arbitrary',[0,1,0;1,1,1;0,1,0]);
SE2 = strel('arbitrary',~SE.Neighborhood);
Ihitmiss = bwhitmiss(I,SE,SE2);

subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Ihitmiss);


