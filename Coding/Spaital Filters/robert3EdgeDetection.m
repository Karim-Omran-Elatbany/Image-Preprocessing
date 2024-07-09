function robert3EdgeDetection(inputImage)
    % Define the Robert 3 filter
    robert3Filter = [1, 0, 0; 0, 0, 0; 0, 0, -1];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, robert3Filter);

    % Display the original and edge-detected images
    figure;
    subplot(1, 2, 1);
    imshow(inputImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(filteredImage, []);
    title('Edge Detection (Robert3)');
end
