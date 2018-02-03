
% CSCI 4527/6527: Project 1, starter Matlab code
clear;

% name of the input file, jpg
[imfolder, imname, format] = fileparts('./data/01887u.tif');

% read in the image
fullim = imread(strcat(imfolder,'/',imname,format));

% seperate the image into three channels
[R, G, B] = seperate_image(fullim);

[m, n] = size(R);

% calculate how many pixel G and B should shift
[gi, gj, bi, bj] = multi_scale_shift_result(R, G, B, 0, 0, 0, 0, 15);

% use the result to align and overlap the image
aligned_image = uint8(cat(3, R, circshift(G,[gi gj]), circshift(B,[bi bj])));

% crop the image
cropped_image = aligned_image(m/15:13*m/15, n/15:14*n/15, :);

% image auto contrast
auto_contrast_image = auto_contrast(cropped_image);

color_image_folder = './result/';

imwrite(aligned_image,strcat(color_image_folder,'colored_multi_scale_new_',imname, '.jpg'));