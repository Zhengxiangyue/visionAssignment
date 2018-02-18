function result = filtering(im, hs, sigma, type)
% im should be a gray-scale floating point image 

% imshow(uint8(im*255));

% low pass filter
fil = fspecial('gaussian', hs*2+1, sigma); 
% imagesc(fil*255);
[m,n] = size(im);

% transformed image
im_fft  = fft2(im);
% imagesc(log(abs(fftshift(im_fft))))

% transformed filter
fil_fft = fft2(fil, m, n);
% imagesc(log(abs(fftshift(fil_fft))))

% transformed filtered image
im_fil_fft = im_fft .* fil_fft;
% imagesc(log(abs(fftshift(im_fil_fft))))

% filtered image
im_fil = ifft2(im_fil_fft);   

% shifted filtered image
im_fil = circshift(im_fil,[-hs-1, -hs-1]);
% imshow(uint8(im_fil*255));

% high pass filter
if(strcmp(type,'high'))
    im_fil = im - im_fil;
end

result = uint8(im_fil*255);

end