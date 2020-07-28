function result = bilateral(data, local_window)

Func = @(data_, local_window_)bilateral_local(data_, local_window_);
result = colfilt(data, local_window, 'sliding', Func, local_window);
end