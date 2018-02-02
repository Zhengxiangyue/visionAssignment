
% CSCI 4527/6527: Project 1, starter Matlab code
clear;

% input image folder
imfolder = './data/';

% name of the input file, jpg
imname = '01725u.jpg';

% read in the image
fullim = imread(strcat(imfolder,imname));

% seperate the image into three channels
[R, G, B] = seperate_image(fullim);

imshow(uint8(scaleBy2(R)));

%  calculate how many pixel G and B should shift
[gi, gj, bi, bj] = multi_scale_shift_result(R, G, B, 0, 0, 0, 0, 15);
  
aligned_image = cat(3, R, circshift(G,[gi gj]), circshift(B,[bi bj]));
  
color_image_folder = './result/';
  
imshow(uint8(aligned_image));
 
imwrite(uint8(aligned_image),strcat(color_image_folder,'colored_multi_scale_new_',imname));

