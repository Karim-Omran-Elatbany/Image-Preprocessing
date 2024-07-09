%blurring specific part of image
function customImageProcessing = customImageProcessing(a)
    % Suppress warnings
    warning off;

    % Display the original image
    imshow(a);
    title('Original Image');

    % Allow the user to interactively select a region of interest (ROI)
    [j, rect] = imcrop(a);

    % Apply averaging filter to the entire image
    ag = fspecial('average', [15,15]);
    g = imfilter(a, ag);

    % Replace the selected region with the cropped image
    g(rect(2):rect(2)+rect(4), rect(1):rect(1)+rect(3), :) = j;

    % Display the result
    imshow(g);
    title('Processed Image');

    % Output the result image
    customImageProcessing = g;
end

%in command window
%inputImage = imread('your_image.jpg'); % Replace with your image file
%resultImage = customImageProcessing(inputImage);
