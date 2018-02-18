
% CSCI 4527/6527: Project 1, starter Matlab code
clear;

% input image folder
imfolder = './';

% name of the input file
imname = '31421v.jpg';

% read in the image
fullim = imread(strcat(imfolder,imname));

% seperate the image into three channels, !!! the result of three channels
% are int16
[R, G, B] = seperate_image(fullim);

% calculate how many pixel G and B should shift
[gi, gj, bi, bj] = single_scale_shift_result(R, G, B, 0, 0, 0, 0, 15);

aligned_image = cat(3, R, circshift(G,[gi gj]), circshift(B,[bi bj]));

color_image_folder = './result/';

imwrite(uint8(aligned_image),strcat(color_image_folder,'colored_single_scale_',imname));