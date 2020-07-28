clearvars
close all
clc

I = imread('kwadraty.png');
I2 = edge(I,'log');
[H,T,R] = hough(I2);
points = houghpeaks(H,8);

subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(I2)

figure
imshow(H,[])
lines = houghlines(I2,T,R,points,'FillGap',5,'MinLength',7);
figure, imshow(I2), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   
end