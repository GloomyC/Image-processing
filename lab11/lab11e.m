clear;
clc;
close all;

I = imread('lunar.bmp');

If = fft2(I);
Ifs = fftshift(If);

Iamp = abs(Ifs);
Iamp = log10(Iamp+1);
Iang = angle(Ifs.*(Iamp>0.0001));

amp = Iamp.*25;
mi = min(amp);
ma = max(amp);
imwrite(uint8(amp),'amp.bmp');

subplot(1,3,1)
imshow(I,[])
title('oryginalny')
subplot(1,3,2)
imshow(Iamp,[])
title('amplituda')
subplot(1,3,3)
imshow(Iang,[])
title('faza')

Mask = imread('mask.bmp');

fft2abs= log10(abs(Ifs)+1);
[X,Y] = size(fft2abs);
for x = 1:X
    for y = 1:Y
        if Mask(x,y) == 0 && fft2abs(x,y) > 0.5
            Ifs(x,y) = 0;
        end
    end
end

Ifinal = ifft2(ifftshift(Ifs));

figure
subplot(1,2,1)
imshow(I,[])
subplot(1,2,2)
Ix= Ifinal-double(I);
imshow(Ifinal,[])