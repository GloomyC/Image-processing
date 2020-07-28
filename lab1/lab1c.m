clearvars
close all
clc

I = imread('chessboard.bmp');
imshow(I)

f = @bicub_interp;
I2 = resize_pic(I,f,100,100);

figure
imshow(I2)

function result = Ax(src,x,y)
    result = (double(picval(src,x+1,y))-double(picval(src,x-1,y)))/2;
end
function result = Ay(src,x,y)
    result = (double(picval(src,x,y+1))-double(picval(src,x,y-1)))/2;
end

function result = Axy(src,x,y)
    result = 0.25*(double(picval(src,x+1,y+1)) - double(picval(src,x-1,y)) - double(picval(src,x,y-1))+ double(picval(src,x,y)));
end

function result = bicub_interp(src, x,y)
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
    
    X = zeros(16,1);
    X(1) = double(picval(src,x_floor,y_floor));
    X(2) =  double(picval(src,x_floor+1,y_floor));
    X(3) =  double(picval(src,x_floor,y_floor+1));
    X(4) =  double(picval(src,x_floor+1,y_floor+1));
    
    X(5) = Ax(src,x_floor,y_floor);
    X(6) = Ax(src,x_floor+1,y_floor);
    X(7) = Ax(src,x_floor,y_floor+1);
    X(8) = Ax(src,x_floor+1,y_floor+1);
    
    X(5) = Ay(src,x_floor,y_floor);
    X(6) = Ay(src,x_floor+1,y_floor);
    X(7) = Ay(src,x_floor,y_floor+1);
    X(8) = Ay(src,x_floor+1,y_floor+1);
    
    X(5) = Axy(src,x_floor,y_floor);
    X(6) = Axy(src,x_floor+1,y_floor);
    X(7) = Axy(src,x_floor,y_floor+1);
    X(8) = Axy(src,x_floor+1,y_floor+1);
    
    Ainv = load('a1.mat');
    Ainv = getfield(Ainv,'A1');
    
    a = Ainv * X;
    
    val = 0.0;
    for x_ = 0:3
        for y_ = 0:3
            val = val + a((x_) + (y_)*4 +1)*power(x_diff,x_)*power(y_diff,y_);
        end
    end
    
    result = val;
end