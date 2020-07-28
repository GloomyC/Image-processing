clearvars
close all
clc

I = imread('lena.bmp');
I2 = imread('jet.bmp');
subplot(2,5,1)
imshow(I)
subplot(2,5,2)
imshow(I2)

I3 = imadd(I,I2,'uint16');
subplot(2,5,3)
imshow(I3,[])
title('add')

I4 = imlincomb(0.2,I,0.8,I2,'uint16');
subplot(2,5,4)
imshow(I4,[])
title('lincomb')

I5 = imsubtract(int16(I),int16(I2));
subplot(2,5,5)
imshow(I5,[])
title('subtract')

I6 = imabsdiff(int16(I),int16(I2));
subplot(2,5,6)
imshow(I6,[])
title('absdiff')

I6 = immultiply(int16(I),int16(I2));
subplot(2,5,7)
imshow(I6,[])
title('multi')

I7 = immultiply(I,2);
subplot(2,5,8)
imshow(I7,[])
title('multi x2')

maska = boolean(imread('kolo.bmp'));
I8 = immultiply(I,maska);
subplot(2,5,9)
imshow(I8,[])
title('mask')

I9 = imcomplement(I);
subplot(2,4,10)
imshow(I9,[])
title('negatyw')












