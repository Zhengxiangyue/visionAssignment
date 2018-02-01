function [gi, gj, bi, bj]  = multi_scale_shift_result(R,inputG,inputB,inigi,inigj,inibi,inibj, search_window_size)

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

% get three images' size
[m, ~] = size(R);

if(m <= 400) 
    [gi, gj, bi, bj] = single_scale_shift_result(R,inputG,inputB,inigi,inigj,inibi,inibj, search_window_size);
else
    scaledR = scaleBy2(R);
    scaledinputG = scaleBy2(inputG);
    scaledinputB = scaleBy2(inputB);
    
    [gi, gj, bi, bj] = multi_scale_shift_result(scaledR,scaledinputG,scaledinputB,inigi,inigj,inibi,inibj, search_window_size);
    
    [gi, gj, bi, bj] = single_scale_shift_result(R,inputG,inputB,2*gi,2*gj,2*bi,2*bj, 2);

end

end