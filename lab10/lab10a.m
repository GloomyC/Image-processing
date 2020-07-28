clear;
clc;
close all;

I = imread('ccl1.png');

Icp = uint32(I);
[height, width] = size(Icp);

L = 1;
N = 100;
id = 1:N;
lut = 1:N;

 for y = 2 : (height-1)
    for x = 2 : (width-1)
        if I(y, x) ~= 0
             neighbors = [Icp(y-1,x-1), Icp(y-1,x), Icp(y-1,x+1), Icp(y,x-1)];
             Sum = sum(neighbors);
             if Sum == 0
                 Icp(y,x) = L;
                 L = L+1;
             elseif  Sum>0 
                 valid = nonzeros(neighbors);
                 mi = min(valid);
                 ma = max(valid);
                 if mi == ma
                     Icp(y,x) = mi;
                 else
                     Icp(y,x) = mi;
                     id(root(ma,id)) = root(mi,id);
                 end
             end
        end
    end
 end
 
 
 subplot(1,2,1);
 imshow(I,[]);
 subplot(1,2,2);
 imshow(Icp,[]);
 
 
 for i = 1:length(lut)
     lut(i) = root(i,id);
 end
 
 Result = zeros(height,width);
 for i = 1:height
      for j = 1:width
          if Icp(i,j) > 0
            Result(i,j) = lut(Icp(i,j));
          end
      end
 end
 
 figure
 imshow(Result,[]);
          
 
 
 