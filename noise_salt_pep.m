function img = noise_salt_pep(img, percent)
% Add salt or pepper noise to image of certain density percentage

img=rgb2gray(img);

mask = rand(size(img));     %generate mask of vals between 0 and 1
img(mask < percent/2) = 0;    % apply mask (50% black)
img((mask >= percent/2)&(mask<percent)) = 255;   %(50% white)

end