function val = convolution_local(data, filter)
local_window = size(filter);
count = size(data);
count = count(2);
val = [];
for i = 1:count
    %my version of reshape
    patch = zeros(local_window);
    for j = 1:local_window(1)
        for k = 1:local_window(2)
            patch(j,k) = data((j-1)*local_window(2) + (k-1) +1 ,i);
        end
    end
    val(i) = sum(sum(patch.*filter));
end
end