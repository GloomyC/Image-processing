clearvars
close all
clc


I1 = imread('lena1.bmp');
I2 = imread('lena2.bmp');
I3 = imread('lena3.bmp');
I4 = imread('lena4.bmp');





subplot(4,2,1)
imshow(I1)
title('lena 1')
subplot(4,2,2)
imshow(I2)
title('lena 2')
subplot(4,2,3)
imshow(I3)
title('lena 3')
subplot(4,2,4)
imshow(I4)
title('lena 4')

subplot(4,2,5)
imhist(I1,256)
title('lena 1 hist')
subplot(4,2,6)
imhist(I2,256)
title('lena 2 hist')
subplot(4,2,7)
imhist(I3,256)
title('lena 3 hist')
subplot(4,2,8)
imhist(I4,256)
title('lena 4 hist')


Ih = imread('hist1.bmp');
%Ih = imread('hist2.bmp');
%Ih = imread('hist3.bmp');
%Ih = imread('hist4.bmp');

figure
subplot(5,3,1)
imshow(Ih)
subplot(5,3,2)
imhist(Ih,256)

[a,b] = imhist(Ih);
a = cumsum(a);
subplot(5,3,3)
plot(b,a)

begin = 0;
endv=0;

[h,x] = imhist(Ih);
for i = 1:256
    if h(i) ~= 0
        begin = i;
        break
    end
end
i = 256;
while true
    if h(i) ~= 0
        endv = i;
        break
    end
    i=i-1;
end

Ihadj = imadjust(Ih,[begin/256,endv/256],[]);
subplot(5,3,4)
imshow(Ihadj)
subplot(5,3,5)
imhist(Ihadj,256)

[H,x] = imhist(Ihadj,256);

Hcum = cumsum(H);
subplot(5,3,6)
plot(x,Hcum)

[a,b] = imhist(Ih,256);;
acum = cumsum(a);
maxhist = max(a);
maxcum = max(acum);

Hcum = uint8(acum * (256/maxcum));

Ihcum = intlut(Ih,Hcum);
subplot(5,3,7)
imshow(Ihcum)

subplot(5,3,8)
imhist(Ihcum,256)

[a,b] = imhist(Ihcum);
a = cumsum(a);
subplot(5,3,9)
plot(b,a)

Ieq = histeq(Ih,256);

subplot(5,3,10)
imshow(Ieq)
subplot(5,3,11)
imhist(Ieq,256)

[a,b] = imhist(Ieq,256);
a = cumsum(a);
subplot(5,3,12)
plot(b,a)

J = adapthisteq(Ih);
subplot(5,3,13)
imshow(J)
subplot(5,3,14)
imhist(J,256)

[a,b] = imhist(J,256);
a = cumsum(a);
subplot(5,3,15)
plot(b,a)







