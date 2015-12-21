function [ C ] = zoom_bi_interp( file, n )
%zoom_bi_interp enlarges image with bilinear interpolation

    % Read Image
    img = imread(file);
    A = rgb2gray(img);

    % Map pixels to a new array with zooming factor (n) 
    [rows,cols] = size(A);
    C = zeros(n*rows,n*cols);
    for i = 1:rows
        for j = 1:cols
            C(1+(i-1)*n,1+(j-1)*n) = A(i,j); 
        end
    end

    % Bilinear interpolation
    for i = 1:(rows-1)*n       %row number
        for j = 1:(cols-1)*n   %column number
            if ((rem(i-1,n) == 0) && (rem(j-1,n) == 0)) 
                % mapped values from the original picture remain in tact    
            
            else  % for pixels that should be calculated.
               % nearest four known pixels for the pixel being calculated
               top_left = C( ceil(i/n)*n-n+1,ceil(j/n)*n-n+1,:); 
               top_right = C( ceil(i/n)*n-n+1+n,ceil(j/n)*n-n+1,:);
               bot_left = C( ceil(i/n)*n-n+1,ceil(j/n)*n-n+1+n,:);
               bot_right = C( ceil(i/n)*n-n+1+n,ceil(j/n)*n-n+1+n,:);
               
               % localize the  pixel being calculated to the nearest four know pixels
               dx = rem(i-1,n)/n;
               dy = rem(j-1,n)/n;

               b1 = top_left;    %constants of bilinear interpolation.
               b2 = top_right-top_left;
               b3 = bot_left-top_left;
               b4 = top_left-top_right-bot_left+bot_right;           
               C(i,j,:) = b1+b2*dx+b3*dy+b4*dx*dy; %equation of bilinear interpolation.
            end
        end
    end
    C = C(1:end-n, 1:end-n);
    imshow(uint8(C))
end
