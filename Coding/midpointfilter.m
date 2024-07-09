function newImg = midpointfilter(oldImg, s)
    [R, C, L] = size(oldImg);
    
    % Determine padding size based on the filter window
    k = (s - 1) / 2;
    
    % Initialize the output image
    newImg = zeros(R, C, L);
    
    % Check if the input image is RGB
    if L == 3
        % Midpoint filter with sorting
        oldImg = padarray(oldImg, [k, k]);
        [R, C, L] = size(oldImg);
        newImg = zeros(R, C, L);

        for i = 1 + k : R - k
            for j = 1 + k : C - k
                % Extract and sort values within the region for each color channel
                subImg = oldImg(i - k : i + k, j - k : j + k, :);
                sortedValues = sort(subImg(:), 'ascend');
                
                % Compute the midpoint for each color channel
                newImg(i, j, :) = 0.5 * (sortedValues(1) + sortedValues(end));
            end
        end
    else
        % Grayscale image
        % Midpoint filter with sorting
        oldImg = padarray(oldImg, [k, k]);
        [R, C, ~] = size(oldImg);
        newImg = zeros(R, C);

        for i = 1 + k : R - k
            for j = 1 + k : C - k
                % Extract and sort values within the region for the grayscale image
                subImg1 = oldImg(i - k : i + k, j - k : j + k);
                sortedValues = sort(subImg1(:), 'ascend');
                
                % Compute the midpoint for the grayscale image
                newImg(i, j) = 0.5 * (sortedValues(1) + sortedValues(end));
            end
        end
    end

    % Clip the values to the range [0, 255]
    newImg = uint8(max(min(newImg, 255), 0));
end
