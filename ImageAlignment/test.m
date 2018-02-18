image = imread('./data/01861a.jpg');



fft_image = abs(fft2(image));
imshow(uint8(fft_image))