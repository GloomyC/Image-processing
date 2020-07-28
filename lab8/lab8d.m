clearvars
close all
clc

I = imread('lab112.png');


imshow(I)

I2 = im2bw(I,37/255);
I2 = not(I2);
I2 = imclearborder(I2);

m = strel('square',5);
I2 = imclose(I2,m);
I2 = imerode(I2,ones(20,4));


subplot(2,2,1)
imshow(I)
subplot(2,2,2)
imshow(I2)

I3 = edge(I2,'Canny');
[H,T,R] = hough(I3);
points = houghpeaks(H,8);

subplot(2,2,3)
imshow(I3)

lines = houghlines(I3,T,R,points,'FillGap',5,'MinLength',5);
subplot(2,2,4)
imshow(I2), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   
end


