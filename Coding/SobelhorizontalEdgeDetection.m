function binaryEdges = SobelhorizontalEdgeDetection(inputImage,t)
    if size(inputImage, 3) == 3
        % If the input image is RGB, convert it to grayscale
        inputImage = rgb2gray(inputImage);
    end

    % Define the horizontal Sobel filter
    horizontalFilter = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, horizontalFilter);

    % Threshold the edges (you can adjust the threshold value)
    threshold = t;
    binaryEdges = filteredImage > threshold;

    % Display the binary edges
    imshow(binaryEdges);
%     title('Binary Edges (Horizontal Sobel Filter)');
end
