function result = movingMean(I,a,n)
cp = I;

[X,Y] = size(I);
mean =0;
for i = 1:X
    sum =0;
    for j = 1:Y
        sum = sum+I(i,j);
    end
    mean = mean + (1/n)*sum;
    if i-n >0
        backsum =0;
        for j = 1:Y
            backsum = backsum+I(i-n,j);
        end
        mean = mean - (1/n)*backsum;
    end
    for j = 1:Y
        if I(i,j) < a* mean
            cp(i,j) = 0;
        else
            cp(i,j) = 255;
        end
    end
    
    result = cp;
    
end


