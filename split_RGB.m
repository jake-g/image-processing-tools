function split_RGB( file )
%split_RGB plots shows each color individually
    img = imread(file);
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    
    figure
    subplot(3,1,1), imshow(R), title('Red')
    subplot(3,1,2), imshow(G), title('Green')
    subplot(3,1,3), imshow(B), title('Blue')
end

