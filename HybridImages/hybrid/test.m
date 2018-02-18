
im1 = imread('img/super.jpg');

im1 = im2single(im1);

R1 = im1(:,:,1);
G1 = im1(:,:,1);
B1 = im1(:,:,1);

dct_r = dct2(R1);

r = filtering(R1,50,10,'low');

dct_filtered_r = dct2(r);

