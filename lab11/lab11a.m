clear;
clc;
close all;

I = imread('dwieFale.bmp');
I = imread('kolo.bmp');
I = imread('kwadrat.bmp');
I = imread('kwadrat45.bmp');
I = imread('trojkat.bmp');


If = fft2(I);

Ifs = fftshift(If);


Iamp = abs(Ifs);
Iamp = log10(Iamp+1);
Iang = angle(Ifs.*(Iamp>0.0001));

subplot(1,3,1)
imshow(I,[])
title('oryginalny')
subplot(1,3,2)
imshow(Iamp,[])
title('amplituda')
subplot(1,3,3)
imshow(Iang,[])
title('faza')

F1 = fft(I,[],1);
F2 = fft(F1,[],2);

Ifs = fftshift(If);
Iamp = abs(Ifs);
Iamp = log10(Iamp+1);
Iang = angle(Ifs.*(Iamp>0.0001));

figure
subplot(1,2,1)
imshow(Iamp,[])
subplot(1,2,2)
imshow(Iang,[])

