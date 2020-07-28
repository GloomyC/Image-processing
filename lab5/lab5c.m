clearvars
close all
clc

I1 = imread('moon.bmp');

M = [[0,1,0],[1,-4,1],[0,1,0]];

M = M/9;

Ic = conv2(I1,M,'same');

I3 = Ic + 128;
I2 = abs(Ic);

subplot(1,4,1)
imshow(I1,[])
title('original');
subplot(1,4,2)
imshow(I2,[])
title('abs')
subplot(1,4,3)
imshow(I3,[])
title('+128')
subplot(1,4,4)
imshow(I1-uint8(Ic),[])
title('sum')


figure

M = fspecial('laplacian',0.8);
Ic = conv2(I1,M,'same');

I3 = Ic + 128;
I2 = abs(Ic);

subplot(1,4,1)
imshow(I1,[])
title('original');
subplot(1,4,2)
imshow(I2,[])
title('abs')
subplot(1,4,3)
imshow(I3,[])
title('+128')
subplot(1,4,4)
imshow(I1-uint8(Ic),[])
title('sum')


