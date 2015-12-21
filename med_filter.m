function [ result ] = med_filter( img, n)
% n is windows size (symmetrical)

img = im2double(img);   % need double not uint8
result = zeros(size(img));
img = padarray(img,[n-2 n-2]);      % pad so index not out of bound

    for i = 1:(size(img,1) - n-1)
        for j = 1:(size(img,2) - n-1)
        window = img(i:i+n-1, j:j+n-1);   % define window
        result(i,j) = median(median(window));   % store median of current window
        end
    end

end