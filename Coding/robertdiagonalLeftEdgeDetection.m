function binaryEdges = robertdiagonalLeftEdgeDetection(inputImage,t)
    if size(inputImage, 3) == 3
        % If the input image is RGB, convert it to grayscale
        inputImage = rgb2gray(inputImage);
    end
    % Define the Robert 4 filter
    robert4Filter = [0, 0, 1; 0, 0, 0; -1, 0, 0];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, robert4Filter);
    
    % Threshold the edges (you can adjust the threshold value)
    threshold = t;
    binaryEdges = filteredImage > threshold;


    % Display the original and edge-detected images
%     figure;
%     subplot(1, 2, 1);
%     imshow(inputImage);
%     title('Original Image');

%     subplot(1, 2, 2);
    imshow(binaryEdges);
%     title('Edge Detection (Robert4)');
end
