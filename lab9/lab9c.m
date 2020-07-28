clearvars
close all
clc

global minsplit;
global stdthresh;
global segRes;
global index;
global means;
means =[];
minsplit = 8;
stdthresh = 0.05;
index = 1;

I = double(imread('umbrealla.png'));



I2 = rgb2hsv(I);

H = double(I2(:,:,1));
segRes = zeros(size(H));
[x,y] = size(H);

S = mysplit(H,[1,x],[1,y]);

subplot(1,3,1);
imshow(H);
subplot(1,3,2);
imshow(segRes,[]);

colorThreshold = 20/255;

i = 1;
while i <= index
    IB = segRes == i;
    if IB == zeros(size(IB))
        i = i+1;
        continue
    end
    [xF,yF] = find(IB,1,'first');
    t = strel('square',3);
    M = imdilate(IB,t);
    M = M-IB;
    p= unique( nonzeros(M.*segRes));
    
    isJoined = 0;
   for neighbor = 1:numel(p)
       IBS = segRes == p(neighbor);

       [yFS, xFS] = find(IBS, 1, 'first');

       colorDiff = abs(means(segRes(yFS, xFS)) - means(segRes(xF,yF)));
       if colorDiff < colorThreshold
           segRes(IBS) = i;
           isJoined = 1;
       end
   end
   if isJoined == 0
      i = i + 1;
   end
     
end

figure;
subplot(1,3,1);
imshow(H);
subplot(1,3,2);
imshow(segRes,[]);




