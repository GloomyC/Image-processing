clear;
clc;
close all;


I = imread('kwadrat.bmp');
%I2 = imread('kwadratT.bmp');
%I2 = imread('kwadrat45.bmp');
%I2 = imread('kwadratS.bmp');
I2 = imread('kwadratKL.bmp');

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

If = fft2(I2);

Ifs = fftshift(If);
Iamp = abs(Ifs);
Iamp = log10(Iamp+1);
Iang = angle(Ifs.*(Iamp>0.0001));

figure
subplot(1,3,1)
imshow(I2,[])
title('zmodyfikowany')
subplot(1,3,2)
imshow(Iamp,[])
title('amplituda')
subplot(1,3,3)
imshow(Iang,[])
title('faza')

