clear;
clc;
close all;

I = imread('shapes.png');
I2 = bwlabel(I,8);

[Y,X] = size(I);

crosses = [2,5,8];
Im1 = (I2 == 2);
Im2 = (I2 == 5);
Im3 = (I2 == 8);
Im = Im1 + Im2 + Im3;

wspolczynniki = obliczWspolczynniki(I2);

subplot(1,2,1)
imshow(I2,[]);
r = regionprops(I2,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

for i = 1:Y
    for j = 1:X
        piksel = I2(i,j);
        if(piksel ~= 0 && ((wspolczynniki(piksel,2) > 0.68 ) ) )
            I2(i,j) = 0;
        end
    end
end

subplot(1,2,2)
imshow(I2,[]);


figure
subplot(2,3,1)
I = imread('shapesReal.png');
imshow(I,[])

I2 = im2bw(I,0.22);
subplot(2,3,2)
imshow(I2,[])

I3 = imerode(I2,strel('rectangle',[3,3]));
I3 = not(imclearborder(not(I3)));
subplot(2,3,3)
imshow(I3,[])

I4 = bwlabel(not(I3),8);
subplot(2,3,4)
imshow(I4,[])
r = regionprops(I4,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

wspolczynniki2 = obliczWspolczynniki(I4);

[Y,X] = size(I4);
for i = 1:Y
    for j = 1:X
        piksel = I4(i,j);
        if(piksel ~= 0 && ((wspolczynniki2(piksel,2) > 0.68 ) || (wspolczynniki2(piksel,3) < 4.9) )) 
            I4(i,j) = 0;
        end
    end
end

subplot(2,3,5)
imshow(I4,[])





