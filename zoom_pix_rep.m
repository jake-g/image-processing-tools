function [ C ] = zoom_pix_rep( file, n )
%zoom_pix_rep enlarges image by repeating pixels by the given factor (n)

    % Read Image
    img = imread(file);
    A = rgb2gray(img);

    % Zoom
    i = 1; j = 1;
    [rows, cols] = size(A);
    C = zeros(rows*n,cols*n);
    for x = 1:rows
        for y = 1:cols
            C(i:i+n-1,j:j+n-1) = A(x,y);
            j = j+n;
        end
        i = i+n;
        j = 1;
    end

    figure;   
    imshow(uint8(C));  % show resulting image
end
