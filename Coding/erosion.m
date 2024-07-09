function B = erosion(imagePath)
    % Read the image
    a = rgb2gray(imagePath);

    % Create a figure for displaying the animation
    
    % Loop for different structural element sizes
    for i = 1:12
        % Create a disk-shaped structural element
        SE = strel('disk', i);

        % Erode the image with the structural element
        B = imerode(a, SE);

        % Display the eroded image
        imshow(B);
        title(['Erosion with Disk SE (Size ' num2str(i) ')']);
        drawnow;

        % Pause to create animation effect
        pause(0.1);
    end

    % Turn off warnings
    warning off;
end

% Command window usage
% imagePath = 'erosion4.png';
% erosion(imagePath);
