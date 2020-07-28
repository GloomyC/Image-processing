clearvars
close all
clc

I = imread('chessboard.bmp');
imshow(I)

f = @nearest_interp;
I2 = resize_pic(I,f,100,100);

figure
imshow(I2)

%x,y have to be in [0,1]
function value = nearest_interp(src, x,y)
    
    s = size(src);
    x=x*double(s(1)) ;
    y=y*double(s(2)) ;
    
    x = x- 0.5;
    y= y- 0.5;
    
    x_floor = floor(x);
    y_floor = floor(y);
    
    x_diff = x-x_floor;
    if x_diff <=0.5
        x_closest = (x_floor);
    else
        x_closest = (x_floor) +1;
    end
        
    y_diff = y-y_floor;
    if y_diff <=0.5
        y_closest = (y_floor);
    else
        y_closest = (y_floor) +1;
    end

    value = src(x_closest+1,y_closest+1);
end

