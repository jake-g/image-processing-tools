function img_hist( img )
%img_hist Creates a histogram of the grayscale values in an image 
    
    limit = 255;    

    % Read Image
    %img = imread(file);
    gray = rgb2gray(img);
    sorted = sort(gray(:));
    
    % Get Frequencies
    last = sorted(1);
    val = zeros(256,2);
    freq = 1; j = 1;
    for i = 2:length(sorted)-1
        if sorted(i) == last
            freq = freq + 1;
        else
            val(j, 2) = freq;
            val(j, 1) = sorted(i - 1);
            freq = 1;
            j = j+1;
        end
        last = sorted(i);
    end
    
    
    % Normalize
    val(: ,2) = val(:,2)/norm(val(:,2));
    
    % Plot
    figure 
    subplot(2,1,1) % Hist
    stem(val(:,1), val(:,2),'marker','none')
    title('Grayscale Histogram')
    xlabel('Value')
    ylabel('Frequency')
    xlim([0,limit])

    subplot(2,1,2)  % cdf
    cdfplot(sorted)
    title('Grayscale CDF')
    xlabel('Value')
    ylabel('Distribution')
    xlim([0,limit])
end

