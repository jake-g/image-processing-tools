function [ result ] = mean_filter( img, n)
% n is windows size (symmetrical)

img = im2double(img);
mask = ones(n)/(n*n);     % Create sliding window mask
result = conv2(img, mask, 'same');    % convolve window mask and img

end