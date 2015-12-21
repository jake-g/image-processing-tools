function split_HSV( file )
%split_RGB plots shows each color individually
    img = imread(file);
    hsv = rgb2hsv(img);    
    H = hsv(:,:,1);
    S = hsv(:,:,2);
    V = hsv(:,:,3);
    
    subplot(3,1,1), imshow(H), title('Hue')
    subplot(3,1,2), imshow(S), title('Sat')
    subplot(3,1,3), imshow(V), title('Value')
end

