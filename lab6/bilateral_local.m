function data_filtered = bilateral_local(data, local_window)
count = size(data,2);
Ycenter = ceil(local_window(1)/2);
Xcenter = ceil(local_window(2)/2);
sigma = 1;

sizeX = local_window(1);
sizeY = local_window(2);

data_filtered = size(data);

h = fspecial('gaussian', local_window, 0.5);

for i = 1:count
    patch = zeros(local_window);
    for j = 1:local_window(1)
        for k = 1:local_window(2)
            patch(j,k) = data((j-1)*local_window(2) + (k-1) +1 ,i);
        end
    end
    dist = zeros(sizeX,sizeY);
    for x = 1:sizeX
        for y = 1:sizeY
            dist(x,y) = sqrt((Xcenter - x)^2 + (Ycenter - y)^2);
        end
    end
        
    dist = dist .* h;
    abs_val = abs(patch - patch(Ycenter,Xcenter));
    
    gamma = exp(((-1)*(abs_val).^2)/2*(sigma)^2);
    
    data_filtered(i) = sum(sum(dist .* gamma .* patch)) / sum(sum(dist .* gamma));
end
end