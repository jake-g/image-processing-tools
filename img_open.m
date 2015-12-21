function [ img ] = img_open( input )
%img_open imports and opens an image

img = imread(input);
imshow(img);

end

