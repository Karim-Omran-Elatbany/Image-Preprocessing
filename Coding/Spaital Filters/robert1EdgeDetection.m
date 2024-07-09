function robert1EdgeDetection(inputImage)
    % Define the Robert 1 filter
    robert1Filter = [0,1,0; 0, 0, 0; 0, -1, 0];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, robert1Filter);

    % Display the original and edge-detected images
    figure;
    subplot(1, 2, 1);
    imshow(inputImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(filteredImage, []);
    title('Edge Detection (Robert1)');
end
