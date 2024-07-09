% Load an example image
old_image = imread('cameraman.tif');

% <<<<<<<<<<<<<<<<<<<<< Ideal filter >>>>>>>>>>>>>>>>>>>> %
ILPF(old_image, 50);
IHPF(old_image, 10);
% _______________________________________________________ %
% <<<<<<<<<<<<<<<<< Butterworth filter >>>>>>>>>>>>>>>>>> %
BLPF(old_image, 50,2);
BHPF(old_image, 10,1);
% _______________________________________________________ %

% <<<<<<<<<<<<<<<<<< Gaussian filter >>>>>>>>>>>>>>>>>>>> %
GLPF(old_image, 50);
GHPF(old_image, 10);
% _______________________________________________________ %



