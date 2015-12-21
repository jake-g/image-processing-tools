function img_eq = hist_eq(file)

% file = '3_3.jpg';
img = imread(file); % input
img_eq = img;       % output
[r, c, d] = size(img);
n = r*c;

for color = 1:d
    % init arrays
    img_gray = img(:,:,color);
    out = zeros(r,c);
    
    % find pdf and cdf and mapping
    [f,~] = imhist(img_gray);
    pdf = f./n;
    cdf = cumsum(pdf);
    val = round(255.*cdf);

    % insert new mapped pixels
    for i = 1:r
        for j = 1:c
            out(i,j) = val(img_gray(i,j)+1);
        end
    end
    out = uint8(out);
    img_eq(:,:,color) = out;
end
end

%     figure, imshow(img_eq);
%     img_hist(img)
%     img_hist(img_eq)


