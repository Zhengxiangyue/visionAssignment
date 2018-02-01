function [R, G, B] = seperate_image(fullim)

% convert to double matrix
fullim = int16(fullim);

% compute the height of each part (just 1/3 of total)
height = floor(size(fullim,1)/3);

% separate color channels
B = fullim(1:height,:);
G = fullim(height+1:height*2,:);
R = fullim(height*2+1:height*3,:);

end