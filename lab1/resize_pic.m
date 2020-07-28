function resized = resize_pic(src,interpolation, x,y)

result = uint8(zeros(x,y));

for x_ = 0:x-1
    x_int = x_/x + 0.5/x;
    for y_ = 0:y-1
        y_int = y_/y + 0.5/y;
        result(x_+1,y_+1) = interpolation(src,x_int,y_int);
    end
end
    resized = result;
end