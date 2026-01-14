
% Read the .jpg image (replace 'image.jpg' with your image path)
% Histogram Equalization
%{
image = imread("C:\Users\kerin\OneDrive\Desktop\School\Intro to vision and robotics\Landscape.jpg");

if isempty(image)
    disp('Error: Could not load the image.');
else
    % Convert the image to grayscale
    
    gray_image = rgb2gray(image);
    gray_cont = imadjust(gray_image);
    squeeze(image(20, 30, :))
    squeeze(gray_image(20,30))
    imshow(gray_cont);

    % Display the shape of the grayscale image (height, width)
    [height, width] = size(gray_image);
    fprintf('Grayscale image shape: %d x %d\n', height, width);

    % Display the pixel values (first 5x5 region for brevity)
    disp('Grayscale pixel values (first 5x5 region):');
    disp(gray_image(1:5, 1:5));

    % Display the grayscale image
    imshow(gray_image);
    gray_image_eq = histeq(gray_image);
    imshow(gray_image_eq);
    title('Grayscale Image');
    %subplot(1,2,1), imhist(gray_image),title('Original Histogram');
    %subplot(1,2,2), imhist(gray_image_eq),title('Equalized Histogram');
    subplot(2,2,1)
    imshow(gray_image)
    title('Original Image')
    [counts1, ~] = imhist(gray_image);
    [counts2, ~] = imhist(gray_image_eq);
    ymax = max([counts1; counts2]) * 1.05;  % 5% padding
    % Equalized image
    subplot(2,2,2)
    imshow(gray_image_eq)
    title('Histogram Equalized Image')
    
    % Original histogram
    subplot(2,2,3)
    imhist(gray_image)
    ylim([0 ymax])
    title('Original Histogram')
    
    % Equalized histogram
    subplot(2,2,4)
    imhist(gray_image_eq)
    ylim([0 ymax])
    title('Equalized Histogram')

end
%}
%Gamma Correction

% Read the image

image = imread("C:\Users\kerin\OneDrive\Desktop\School\Intro to vision and robotics\Landscape.jpg");

if isempty(image)
    disp('Error: Could not load the image.');
else
    gray_image = rgb2gray(image);

    gray_norm = im2double(gray_image);

    % Gamma values
    gamma_values = [1, 0.5, 1.5, 2];

    % Apply gamma correction
    gamma_img1 = gray_norm .^ gamma_values(1); % γ = 1
    gamma_img2 = gray_norm .^ gamma_values(2); % γ = 0.5
    gamma_img3 = gray_norm .^ gamma_values(3); % γ = 1.5
    gamma_img4 = gray_norm .^ gamma_values(4); % γ = 2

    % Convert back to uint8 for display
    gamma_img1 = im2uint8(gamma_img1);
    gamma_img2 = im2uint8(gamma_img2);
    gamma_img3 = im2uint8(gamma_img3);
    gamma_img4 = im2uint8(gamma_img4);

    squeeze(gray_image(20, 30))
    squeeze(gamma_img3(20,30))
    squeeze(gamma_img2(20,30))
    % Display results
    figure

    subplot(2,2,1)
    imshow(gamma_img1)
    title('\gamma = 1 (Original)')

    subplot(2,2,2)
    imshow(gamma_img2)
    title('\gamma = 0.5 (Brightened)')

    subplot(2,2,3)
    imshow(gamma_img3)
    title('\gamma = 1.5 (Darkened)')

    subplot(2,2,4)
    imshow(gamma_img4)
    title('\gamma = 2 (More Darkening)')
end
