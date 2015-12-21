function [ C ] = shrink_pix_rm( file, n )
%shrink_pix_rm shrinks the image by removeing pixels proportionally based
%off the factor (n)

    % Read Image
    img = imread(file);
    A = rgb2gray(img);
    
    % Shrink
    C = A(1:n:end, 1:n:end);
    figure
    imshow(uint8(C))

end

