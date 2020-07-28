clearvars
close all
clc

I = imread('kolo.bmp');
I2 = boolean(imread('kwadrat.bmp'));

subplot(4,2,1)
imshow(I,[])
title('I 1')

subplot(4,2,2)
imshow(I2,[])
title('I 2')

subplot(4,2,3)
imshow(~I,[]);
title('not 1')

subplot(4,2,4)
imshow(~I2,[]);
title('not 2')

subplot(4,2,5)
imshow(I & I2,[]);
title('and')

subplot(4,2,6)
imshow(I | I2,[]);
title('or')

subplot(4,2,7)
imshow(xor(I , I2),[]);
title('xor')

