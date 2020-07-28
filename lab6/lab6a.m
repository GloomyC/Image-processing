clearvars
close all
clc

load MR_data


Im = I_noisy4;

subplot(1,3,1)
imshow(Im,[]);
filter = fspecial('gaussian',5,1);
Ifilt = convolution(Im,filter);
subplot(1,3,2)
imshow(Ifilt,[]);

localWindow = [5,5];

Ifilt = bilateral(Im,localWindow);
subplot(1,3,3)
imshow(uint8(Ifilt),[])
