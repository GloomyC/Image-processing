clearvars
close all
clc

I = imread('chessboard.bmp');
imshow(I)

f = @bilin_interp;
I2 = resize_pic(I,f,100,100);

figure
imshow(I2)

%x,y have to be in [0,1]
function value = bilin_interp(src, x,y)
    
    s = size(src);
    x=x*double(s(1)) ;
    y=y*double(s(2)) ;
    
    x = x- 0.5;
    y= y- 0.5;
    
    x_floor = floor(x);
    y_floor = floor(y);
    
    x_diff = x-x_floor;
    y_diff = y-y_floor;
    
    x_floor = x_floor +1;
    y_floor = y_floor +1;
    
    v1 = (1-x_diff)*picval(src,x_floor,y_floor) + x_diff*picval(src,x_floor+1,y_floor);
    v2 = (1-x_diff)*picval(src,x_floor,y_floor+1) + x_diff*picval(src,x_floor+1,y_floor+1);
    
    value = (1-y_diff)*v1 + y_diff*v2;
end

