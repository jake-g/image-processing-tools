function stretch = lin_stretch(file)

    % Linear stretching applied to the entire image.
    img = imread(file);
    stretch = img;
    for color = 1:3       
        temp = img(:,:,color);
        gray_min = min(min(temp));          % min value of pixel in the image
        gray_max = 150%max(max(temp));          % max value of pixel in the image
        slope = 255/(gray_max - gray_min);  % find the slope of intersection of point (0,255) to (rmin,rmax)
        offset = 255 - slope*gray_max;      % find the intercept of the straight line with the axis
        stretch(:,:,color) = slope*temp + offset;   % linear transform the image
    end 
    imshow(stretch);
    img_hist(stretch);
end