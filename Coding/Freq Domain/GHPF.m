function GHPF(input_image, D0)

    % Saving the size of the input_image in pixels- 
    % M : no of rows (height of the image) 
    % N : no of columns (width of the image) 
    [M, N] = size(input_image); 

    % Getting Fourier Transform of the input_image 
    % using MATLAB library function fft2 (2D fast fourier transform) 
    FT_img = fft2(double(input_image)); 

    % Designing filter 
    u = 0:(M-1); 
    idx = find(u > M/2); 
    u(idx) = u(idx) - M; 
    v = 0:(N-1); 
    idy = find(v > N/2); 
    v(idy) = v(idy) - N; 

    % MATLAB library function meshgrid(v, u) returns 
    % 2D grid which contains the coordinates of vectors 
    % v and u. Matrix V with each row is a copy 
    % of v, and matrix U with each column is a copy of u 
    [V, U] = meshgrid(v, u); 

    % Calculating Euclidean Distance 
    D = sqrt(U.^2 + V.^2); 

    % Gaussian High-Pass Filter Function
    H = 1 - exp(-(D.^2) / (2 * (D0^2)));

    % Convolution between the Fourier Transformed 
    % image and the mask 
    G = H .* FT_img; 

    % Getting the resultant image by Inverse Fourier Transform 
    % of the convoluted image using MATLAB library function 
    % ifft2 (2D inverse fast fourier transform) 
    output_image = real(ifft2(double(G))); 

    % Display the original image
    figure;
    subplot(1, 3, 1);
    imshow(input_image);
    title('Original Image');
    % Display the filtered image
    subplot(1, 3, 2);
    imshow(abs(output_image), []);
    title('Filtered Image (Gaussian High-pass)');

    % Display the filter in the spatial domain
    subplot(1, 3, 3);
    imshow(H, []);
    title('Gaussian High-pass Filter');
end
