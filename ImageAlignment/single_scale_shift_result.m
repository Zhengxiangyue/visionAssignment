function [gi, gj, bi, bj]  = single_scale_shift_result(R,inputG,inputB,inigi,inigj,inibi,inibj, search_window_size)

% Try to align G and B onto R
% return their shifted vertical and horizontal value

% R                     - the grayscale matrix of red channel, int 
% G                     - the grayscale matrix of green channel, int 
% B                     - the grayscale matrix of blue channel, int 
% inigi, inigj          - the initial shifted values of G, the [1,1] point
% of the image G(the left top most pixel) will initially be shifted to
% locate at [1+inigi, 1+inigj]. In the single scale implementation, they
% should be 0.
% inibi, inibj          - same thing for image B
% search_window_size    - range of calculation, vertical shift from 
% [inigi - search_window_size] to [inigi + search_window_size]

R = int16(R);

G = int16(circshift(inputG, [inigi inigj]));

B = int16(circshift(inputB, [inibi inibj]));


% get three images' size
[m, n] = size(R);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% input parameters begin 

% initialize search window size, -search_window_size ~ search_window_size,
% total search_window_size*2 + 1 overlapped images

% score_window should >= 0 and < 1/2
score_window = 1/4;

% input parameters end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% record all scores, maybe I want to plot them later
scoreOfRandG(1:search_window_size * 2 + 1,1:search_window_size * 2 + 1) = 0;
scoreOfRandB = scoreOfRandG;

% initialize the max score to 0
maxScoreForRandG = 0;
maxScoreForRandB = 0;

for i = -search_window_size:search_window_size
    for j = -search_window_size:search_window_size
        
        indexI = i+search_window_size+1; indexJ = j+search_window_size+1;
        scoreOfRandG(indexI,indexJ) = BrennerGradientScore((R + circshift(G,[i j]))/2,m*score_window,m*(1-score_window),n*score_window,n*(1-score_window));
        scoreOfRandB(indexI,indexJ) = BrennerGradientScore((R + circshift(B,[i j]))/2,m*score_window,m*(1-score_window),n*score_window,n*(1-score_window));

        if(maxScoreForRandG < scoreOfRandG(indexI,indexJ))
            maxScoreForRandG = scoreOfRandG(indexI,indexJ);
            gi = i;gj = j;
        end
        
        if(maxScoreForRandB < scoreOfRandB(indexI,indexJ))
            maxScoreForRandB = scoreOfRandB(indexI,indexJ);
            bi = i;bj = j;
        end
    end
end

gi = gi + inigi;gj = gj + inigj;bi = bi + inibi; bj = bj + inibj;

end