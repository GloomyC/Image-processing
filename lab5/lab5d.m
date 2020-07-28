clearvars
close all
clc

load maskiPP

I1 = imread('kw.bmp');

M = S2;

M = M/9;

Ic = conv2(I1,M,'same');

I3 = Ic + 128;
I2 = abs(Ic);

subplot(1,4,1)
imshow(I1,[])
title('original');
subplot(1,4,2)
imshow(I2,[])
title('abs')
subplot(1,4,3)
imshow(I3,[])
title('+128')
subplot(1,4,4)
imshow(I1-uint8(Ic),[])
title('sum')


s = size(I1);

m1 = conv2(I1,S1,'same'); 
m2 = conv2(I1,S2,'same'); 

m1 = m1.^2;
m2 = m2.^2;
Ik = double(m1) + double(m2);
Ik = Ik.^0.5;
Ik = uint8(Ik);

figure
subplot(1,2,1)
imshow(I1)
title('original')
subplot(1,2,2)
imshow(Ik,[])
title('combined pow')

m1 = m1.^0.5;
m2 = m2.^0.5;
Ik = double(m1) + double(m2);
Ik = uint8(Ik);

figure
subplot(1,2,1)
imshow(I1)
title('original')
subplot(1,2,2)
imshow(Ik,[])
title('combined abs')
