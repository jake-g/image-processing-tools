close all
file = '3_1.bmp';
img = imread(file);
contrast = 1.05; % multiplier
brightness = 10;  % additive
red_adj = -20;
green_adj = 40;
blue_adj = 20;

img(:,:,1) = img(:,:,1) + red_adj;      % adjust red
img(:,:,2) = img(:,:,2) + green_adj;    % adjust green
img(:,:,3) = img(:,:,3) + blue_adj;     % adjust blue
img = img + brightness;                 % change brighness
img = img*contrast;                     % change contrast
imshow(img)

% 
% hsv = rgb2hsv(img);
% hsv(:,:,:) = hsv(:,:,2);
