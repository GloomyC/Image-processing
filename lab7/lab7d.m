clearvars
close all
clc

I = imread('calculator.bmp');
SE = ones(1,71);
Ieroded = imerode(I,SE);
Irecon = imreconstruct(Ieroded,I);
Itop = imtophat(I,SE);
I2 = I - Irecon;

SE = ones(1,11);
I2eroded = imerode(I2,SE);
I2recon = imreconstruct(I2eroded,I2);

I3 = I2 - I2recon;

SE = ones(1,21);
Idil = imdilate(I2recon,SE);

IFinal = imreconstruct(min(Idil,I2),I2);

subplot(2,2,1)
imshow(I);
title("original")
subplot(2,2,2)
imshow(Ieroded);
title("eroded")
subplot(2,2,3)
imshow(Irecon);
title("reconstructed")

figure
subplot(2,2,1)
imshow(Itop);
title("tophat")
subplot(2,2,2)
imshow(I2);
title("minus Bckground")
subplot(2,2,3)
imshow(I2recon);
title("reconstructed 2")
subplot(2,2,4)
imshow(Idil);
title("dilated")

figure
imshow(IFinal)
title("final image");







