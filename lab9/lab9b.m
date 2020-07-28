clearvars
close all
clc

Io = double(imread('knee.png'));
h = fspecial('gaussian',3,1);
I = imfilter(Io,h);
[sizeX,sizeY]  = size(I);
hold on


imshow(I,[])
P = uint32(round(ginput(1)));
P = [P(2),P(1)];
%P = uint32([340,216]);

threshold = 8;

visited = uint8(zeros(size(I)));
segmented = uint8(zeros(size(I)));
stack = uint32(zeros(10000,2));
iStack = 1;

stack(1,1) = P(1);
stack(1,2) = P(2);
segmented(P(1),P(2)) = 1;
average = I(P(1),P(2));
count = 1;

while iStack >= 1
   
    neighboursX = [];
    neighboursY = [];
    neighSize = 0;
    
    d = int32([-1,0,1]);
    
    currP = [stack(iStack,1),stack(iStack,2)];
    
    iStack = iStack-1;
    if visited(currP(1),currP(2))
        continue
    end
    
    for x = d
        for y = d
            if x == 0 && y == 0
                continue
            end
            
            posX = int32(int32(currP(1)) + x);
            posY = int32(int32(currP(2)) + y);
            
            %invalid indexes out of image
            if posX < 1 || posY < 1 || posX > sizeX || posY > sizeY
                continue
            end
            if visited(posX,posY) == 0
                if abs(I(posX,posY)-average) <= threshold
                    stack(iStack+1,1) = posX;
                    stack(iStack+1,2) = posY;
                    iStack = iStack + 1;

                    segmented(posX,posY) = 1;
                    
                    average = (average * count + I(posX,posY))/(count +1);
                    count = count +1;
                    
                end
            end
        end
    end
        
    
    visited(currP(1),currP(2)) = 1;
    
        
    
    
end

figure
subplot(1,2,1)
imshow(Io,[])
subplot(1,2,2)
imshow(segmented,[])






