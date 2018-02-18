function [score] = BrennerGradientScore(inputImage, iStart, iEnd, jStart, jEnd)
% BRENNERGRADIENTSCORE Input an grayscale image, using [xStart, xEnd]
% [yStart, yEnd] as the window to calculate the sharpness score 

inputImage = double(inputImage);

% check if the image is a grayscale image

% if(iEnd - iStart > 200) 
%     iEnd = iStart + 200;
% end
% 
% if(jEnd - jStart > 200)
%     jEnd = jStart +200;
% end
   

% initialize the score to zero
score = 0;

for i = floor(iStart) + 1:floor(iEnd) - 2
    for j = floor(jStart) + 1:floor(jEnd) - 2
        score = score + (inputImage(i,j+2) - inputImage(i,j)) * (inputImage(i,j+2) - inputImage(i,j));
    end
end

end

