function [ C ] = shrink_average( A, n )
%shrink_average shrinks the image by averaging a sliding window of pixels
%based off the factor (n)

    % Read Image
    img = imread(file);
    A = rgb2gray(img);
    
    % Shrink
    i = 1; j = 1;
    [rows, cols] = size(A);
    C = zeros(rows/n,cols/n);
    for x = 1:n:rows
        for y = 1:n:cols
            block = A(x:x+n-1,y:y+n-1);
            C(i,j) = mean(block(:));
            j = j+1;
        end
        i = i+1;
        j = 1;
    end

    % figure;
    % imshow(uint8(A));                          %// show original image
    figure;   
    imshow(uint8(C));                          %// show resulting image

end
