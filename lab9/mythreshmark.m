function result = mythreshmark(I,x,y,threshold)
    [sizeX,sizeY]  = size(I);


    P = [x,y];
    %P = uint32([340,216]);

    visited = uint8(zeros(size(I)));
    segmented = uint8(zeros(size(I)));
    stack = uint32(zeros(10000,2));
    iStack = 1;

    stack(1,1) = P(1);
    stack(1,2) = P(2);
    segmented(P(1),P(2)) = 1;

    while iStack >= 1

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
                    if abs(I(posX,posY)-I(currP(1),currP(2))) <= threshold
                        stack(iStack+1,1) = posX;
                        stack(iStack+1,2) = posY;
                        iStack = iStack + 1;

                        segmented(posX,posY) = 1;

                    end
                end
            end
        end


        visited(currP(1),currP(2)) = 1;




    end
result = segmented;
end

