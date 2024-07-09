function magnitude_spectrum_gray = FourierTransform(image_path)
    % Load the image
    input_image = image_path;
    
    % Convert the image to double for processing
    input_image_double = double(input_image);

    % Check if the image is RGB
    is_rgb = size(input_image, 3) == 3;

    % Compute the 2D Fourier Transform for each color channel if RGB
    if is_rgb
        ft_red = fft2(input_image_double(:,:,1));
        ft_green = fft2(input_image_double(:,:,2));
        ft_blue = fft2(input_image_double(:,:,3));

        % Shift zero frequency components to the center
        ft_red_shifted = fftshift(ft_red);
        ft_green_shifted = fftshift(ft_green);
        ft_blue_shifted = fftshift(ft_blue);

        % Calculate the magnitude spectrum for each channel
        magnitude_spectrum_red = log(1 + abs(ft_red_shifted));
        magnitude_spectrum_green = log(1 + abs(ft_green_shifted));
        magnitude_spectrum_blue = log(1 + abs(ft_blue_shifted));

      

        % Combine the channels to get the reconstructed RGB image
        magnitude_spectrum_gray = cat(3, abs(magnitude_spectrum_red), abs(magnitude_spectrum_green), abs(magnitude_spectrum_blue));
    else
        % If the image is grayscale, perform Fourier Transform on the single channel
        ft_gray = fft2(input_image_double);

        % Shift zero frequency components to the center
        ft_gray_shifted = fftshift(ft_gray);

        % Calculate the magnitude spectrum
        magnitude_spectrum_gray = log(1 + abs(ft_gray_shifted));

     
    end

    % Display the original image, magnitude spectrum, and the reconstructed image

    % Original image
%     subplot(1, 3, 1);
%     imshow(uint8(input_image));
%     title('Original Image');

    % Magnitude spectrum
%     subplot(1, 2, 1);
    if is_rgb
        imshow(magnitude_spectrum_red + magnitude_spectrum_green + magnitude_spectrum_blue, []);
    else
        imshow(magnitude_spectrum_gray, []);
    end
%     title('FT');

    % Reconstructed image from the inverse Fourier Transform
  
end
