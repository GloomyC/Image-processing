clear;
clc;
close all;

I = imread('lena.bmp');

Ifs = fftshift(fft2(I));

Iamp = abs(Ifs);
Iamp = log10(Iamp+1);
Iang = angle(Ifs.*(Iamp>0.0001));

subplot(1,3,1)
imshow(I,[])
title('oryginalny')
subplot(1,3,2)
imshow(Iamp,[])
title('amplituda')
subplot(1,3,3)
imshow(Iang,[])
title('faza')

figure
[f1,f2] = freqspace(512,'meshgrid');

Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd((r>0.1)) =0;


%h = fwind1(Hd,hann(21));
%[Hd f1 f2] = freqz2(h,512,512);
Ifiltered = Ifs .* Hd;

Ifinal = ifft2(ifftshift(Ifiltered));

subplot(2,3,4)
mesh(f1,f2,Hd);
subplot(2,3,1)
imshow(Ifinal,[])
title('dolnoprzepustowy');

Hd = ones(512);

r = sqrt(f1.^2 + f2.^2);

Hd((r<0.1)) =0;
%h = fwind1(Hd,hann(21));
%[Hd f1 f2] = freqz2(h,512,512);
Ifiltered = Ifs .* Hd;

Ifinal = ifft2(ifftshift(Ifiltered));

subplot(2,3,5)
mesh(f1,f2,Hd);
subplot(2,3,2)
imshow(Ifinal,[])
title('górnoprzepustowy');

Hd = ones(512);

r = sqrt(f1.^2 + f2.^2);

Hd((r>0.1 & r<0.4)) =0;
%h = fwind1(Hd,hann(21));
%[Hd f1 f2] = freqz2(h,512,512);
Ifiltered = Ifs .* Hd;

Ifinal = ifft2(ifftshift(Ifiltered));

subplot(2,3,6)
mesh(f1,f2,Hd);
subplot(2,3,3)
imshow(Ifinal,[])
title('pasmowy');


G = fspecial('gaussian',512,10);

G = mat2gray(G);

Ifiltered = Ifs .* G;
Ifinal = ifft2(ifftshift(Ifiltered));

figure
subplot(1,2,1)
imshow(I,[]);
subplot(1,2,2)
imshow(Ifinal,[]);




