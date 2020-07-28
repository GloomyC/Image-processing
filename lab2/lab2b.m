clearvars
close all
clc

load funkcjeLUT;

I = imread('lena.bmp');

figure(1)
LUT(I,kwadratowa)

figure(2)
LUT(I,log)

figure(3)
LUT(I,odwlog)

figure(4)
LUT(I,odwrotna)

figure(5)
LUT(I,pierwiastkowa)

figure(6)
LUT(I,pila)

figure(7)
LUT(I,wykladnicza)

