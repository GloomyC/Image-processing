clearvars
close all
clc

I = imread('dom.png');
I2 = edge(I,'log');
I3 = edge(I,'Canny');
I4 = edge(I,'Sobel');

subplot(2,2,1)
imshow(I)
title("original")
subplot(2,2,2)
imshow(I2)
title("log")
subplot(2,2,3)
imshow(I3)
title("canny")
subplot(2,2,4)
imshow(I4)
title("sobel")

figure

I2 = edge(I,'log',0.01,2);
I3 = edge(I,'Canny',[0 0.1], 3);
I4 = edge(I,'Sobel',0.15);

subplot(2,2,1)
imshow(I)
title("original")
subplot(2,2,2)
imshow(I2)
title("log")
subplot(2,2,3)
imshow(I3)
title("canny")
subplot(2,2,4)
imshow(I4)
title("sobel")


