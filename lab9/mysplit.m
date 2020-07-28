function result = mysplit(I,P1,P2)

global minsplit;
global stdthresh;
global segRes;
global index;
global means;
x1 = P1(1);
x2 = P1(2);
y1 = P2(1);
y2 = P2(2);

segment = I(x1:x2,y1:y2);

segvec = segment(:);

segmean = mean(mean(I(x1:x2,y1:y2)))
segstd = std(segvec);

if segstd <= stdthresh || x2-x1 <= minsplit || y2 - y1 <= minsplit
    segRes(x1:x2,y1:y2) = index;
    means(index) = segmean;
    index = index +1;
    
else
    dx = uint32(floor(x2-x1)/2);
    dy = uint32(floor(y2-y1)/2);
    
    mysplit(I,[x1,x1+dx],[y1,y1+dy]);
    mysplit(I,[x1+dx+1,x2],[y1,y1+dy]);
    mysplit(I,[x1,x1+dx],[y1+dy+1,y2]);
    mysplit(I,[x1+dx+1,x2],[y1+dy+1,y2]);
end

result = 0;

