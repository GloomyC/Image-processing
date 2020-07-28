function LUT(obraz,przekodowanie)

subplot(2,2,1:2)
plot(przekodowanie)
title("przekodowanie wartoœci");
xlim([0,255])
ylim([0,255])
daspect([1,1,1])

subplot(2,2,3)
imshow(obraz)

subplot(2,2,4)  
I2 = intlut(obraz,przekodowanie);
imshow(I2)
end

