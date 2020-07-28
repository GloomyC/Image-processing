clearvars
close all
clc


I1 = imread('rice.png');
imshow(I1)

windowSize = 15;

Icp = I1;
[X,Y] = size(I1);

for i = 1:X
    for j = 1:Y
        threshold = meanLT(i,j,uint8(windowSize/2),I1,X,Y);
        
        if Icp(i,j) < threshold
            Icp(i,j) = 0;
        else
            Icp(i,j) = 255;
        end
    end
end
subplot(2,2,1)
imshow(I1)
subplot(2,2,2)
imshow(Icp)


k = 0.15;
R = 128;
for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,uint8(windowSize/2),I1,X,Y);
        stdev = stddevLT(i,j,uint8(windowSize/2),I1,mean,X,Y);
        threshold = mean *(1- k*(stdev/R -1));
        
        if Icp(i,j) < threshold
            Icp(i,j) = 0;
        else
            Icp(i,j) = 255;
        end
    end
end

subplot(2,2,4)
imshow(Icp)
    
    
    
    
    