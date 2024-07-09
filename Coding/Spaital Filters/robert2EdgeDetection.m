function robert2EdgeDetection(inputImage)
    % Define the Robert 2 filter
    robert2Filter = [0, 0, 0; 1, 0, -1; 0, 0, 0];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, robert2Filter);

    % Display the original and edge-detected images
    figure;
    subplot(1, 2, 1);
    imshow(inputImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(filteredImage, []);
    title('Edge Detection (Robert2)');
end
