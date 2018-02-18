function im = hybridImage(im1, im2, cutoff_low, cutoff_high)
img1 = filtering(im1,50,cutoff_low,'low');
img2 = filtering(im2,50,cutoff_high,'high');

im = (img1+img2);

end