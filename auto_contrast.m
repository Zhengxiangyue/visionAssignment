function output_image = auto_contrast(image)
    output_image = image;
    gray_image = rgb2gray(image);
    
    min = 255;
    max = 0;
    [m, n, ~] = size(image);
    
    for i= 1:m
        for j = 1:n
            if(min > gray_image(i,j))
                min = gray_image(i,j);
                ai = i;
                aj = j;
            end
            
            if(max < gray_image(i,j))
                max = gray_image(i,j);
            end
        end
    end
        
    for i = 1:m
        for j = 1:n
            output_image(i,j,1) = remap(image(i,j,1), 20, 240);
            output_image(i,j,2) = remap(image(i,j,2), 20, 240);
            output_image(i,j,3) = remap(image(i,j,3), 20, 240);
        end
    end
end

function new_value = remap(v, min, max)
    
    v = double(v);
    min = double(min);
    max = double(max);

    if(v < min || v > max) 
        new_value = v;
        return;
    end
    
    new_value =  uint8(((v - min) * 255 / (max - min)));
end