function val = convolution(Img,filter)
windowSize = size(filter);
x = windowSize(1);
y = windowSize(2);

Func = @(data_)convolution_local(data_,filter);
    
val = colfilt(Img,[x,y],'sliding',Func);
end

