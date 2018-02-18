close all; % closes all figures

input_folder = 'img/';

% high frequency dominate when the hybrid image is large
result_high = 'face1.jpg';

% low frequency domintate when the hybrid image is small
result_low = 'face2.jpg';

% read images and convert to single format
im1 = im2single(imread(strcat(input_folder,result_high)));
im2 = im2single(imread(strcat(input_folder,result_low)));

% Thank our professor for providing the aligning function
[im2, im1] = align_images(im2, im1);

% Seperate 3 channels
R1 = im1(:,:,1);
G1 = im1(:,:,2);
B1 = im1(:,:,3);

R2 = im2(:,:,1);
G2 = im2(:,:,2);
B2 = im2(:,:,3);

%% Choose the cutoff frequencies and compute the hybrid image
cutoff_low = 9;

cutoff_high = 10; 

r12 = hybridImage(R1, R2, cutoff_low, cutoff_high);
g12 = hybridImage(G1, G2, cutoff_low, cutoff_high);
b12 = hybridImage(B1, B2, cutoff_low, cutoff_high);

% Get the colored image
im12 = cat(3, r12, g12, b12);

%% Crop resulting image (optional)
figure(1), hold off, imagesc(im12), axis image, colormap gray
disp('input crop points');
[x, y] = ginput(2);  x = round(x); y = round(y);
im12 = im12(min(y):max(y), min(x):max(x), :);
figure(1), hold off, imagesc(im12), axis image, colormap gray

result_folder = 'result/';

imwrite(im12,strcat(result_folder,'result_',result_low));

%% Compute and display Gaussian and Laplacian Pyramids (you need to supply this function)
N = 50; % number of pyramid levels (you may use more or fewer, as needed)
blurred_image = pyramids(im12, N);

imwrite(blurred_image, strcat(result_folder,'small_result_',result_low))
