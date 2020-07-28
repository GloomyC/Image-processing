clearvars
close all
clc


I = zeros(11,11);
I(3,7) = 1;
I(6,9) = 1;

[H,T,R] = hough(I,'RhoResolution',0.1,'THetaResolution',0.5);

X = 114;
Y = 181;

rho = R(Y);
theta = T(X);

y = ones(1,100);
x = ones(1,100);
for i = 0:100
    x(i+1) = (i)/10;
    y(i+1) = (rho - ((i)/10)*cosd(theta))/sind(theta);
end


imshow(I,[])
hold on
plot(x+1,y+1)
hold off

figure
imshow(H,[])

