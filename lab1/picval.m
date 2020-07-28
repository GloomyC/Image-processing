function result = picval(src, x,y)
    if x <1
        x = 1;
    end
    if y <1
        y = 1;
    end
    s = size(src);
    if x > s(1)
        x = s(1);
    end
    if y > s(2)
        y = s(1);
    end
    
    result = src(x,y);
end