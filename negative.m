function C = negative( file )
%negative returns and shows the inverse or negative of an input image

    % Read Image
    img = imread(file);
    A = rgb2gray(img);
    C = 255 - A;
    imshow(uint8(C))

end

