function SobelverticalEdgeDetection(inputImage)
    % Define the vertical Sobel filter
    verticalFilter = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, verticalFilter);

    % Display the original and edge-detected images
    figure;
    subplot(1, 2, 1);
    imshow(inputImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(filteredImage, []);
    title('Edge Detection (Vertical)');
end
