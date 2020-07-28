clearvars
close all
clc

%I1 = imread('plansza.bmp');
I1 = imread('lena.bmp');

h2 = fspecial('average', 3);
I2 = conv2( I1, h2, 'same');
I2 = uint8(I2);

h3 = fspecial('average', 5);
I3 = conv2( I1, h3, 'same');
I3 = uint8(I3);

h4 = fspecial('average', 9);
I4 = conv2( I1, h4, 'same');
I4 = uint8(I4);

h5 = fspecial('average', 15);
I5 = conv2( I1, h5, 'same');
I5 = uint8(I5);

subplot(5,2,1)
imshow(I1)

subplot(5,2,3)
imshow(imabsdiff(I1,I2),[])
subplot(5,2,4)
imshow(I2)

subplot(5,2,5)
imshow(imabsdiff(I1,I3),[])
subplot(5,2,6)
imshow(I3)

subplot(5,2,7)
imshow(imabsdiff(I1,I4),[])
subplot(5,2,8)
imshow(I4)

subplot(5,2,9)
imshow(imabsdiff(I1,I5),[])
subplot(5,2,10)
imshow(I5)


figure
M = [[1,2,1],[2,4,2],[1,2,1]];
M = M/sum(sum(M));
I2 = conv2( I1, M, 'same');
I2 = uint8(I2);

subplot(1,3,1)
imshow(I1)
subplot(1,3,2)
imshow(I2)
subplot(1,3,3)
imshow(imabsdiff(I1,I2),[])


m1 = fspecial('gaussian',5,0.5);
m2 = fspecial('gaussian',5,0.25);
m3 = fspecial('gaussian',5,1);
m4 = fspecial('gaussian',5,2);

figure
subplot(2,2,1)
mesh(m1)
subplot(2,2,2)
mesh(m2)
subplot(2,2,3)
mesh(m3)
subplot(2,2,4)
mesh(m4)




