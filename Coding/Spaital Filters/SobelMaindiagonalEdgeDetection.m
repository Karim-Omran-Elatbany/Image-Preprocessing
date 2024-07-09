function SobelMaindiagonalEdgeDetection(inputImage)
     % Define the diagonal Sobel filters
    diagonalFilter = [2, 1, 0; 1, 0, -1; 0, -1, -2];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, diagonalFilter);

    % Display the original and edge-detected images
    figure;
    subplot(1, 2, 1);
    imshow(inputImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(filteredImage, []);
    title('Edge Detection (Main Diagonal)');
end
