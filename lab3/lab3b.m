clearvars
close all
clc

I1 = imread('phobos.bmp');

I2 = histeq(I1);

load histogramZadany


I3 = histeq(I1,histogramZadany);

[h,x] = imhist(I1);
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
I4 = imadjust(I1,[begin/256,endv/256],[]);

I5 = adapthisteq(I1);

x = [1:255];
plot(x,histogramZadany)
figure

subplot(5,2,1)
imshow(I1)
subplot(5,2,2)
imhist(I1)

subplot(5,2,3)
imshow(I2)
subplot(5,2,4)
imhist(I2)

subplot(5,2,5)
imshow(I3)
subplot(5,2,6)
imhist(I3)

subplot(5,2,7)
imshow(I4)
subplot(5,2,8)
imhist(I4)

subplot(5,2,9)
imshow(I5)
subplot(5,2,10)
imhist(I5)




