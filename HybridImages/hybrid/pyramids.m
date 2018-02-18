function blurred_image = pyramids(input, n)
for i = 1:n
    input = imgaussfilt(input, 1.5);
    imshow(input);
end
blurred_image = imresize(input,1 / 5);
end