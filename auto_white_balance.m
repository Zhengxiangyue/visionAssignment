function RGB_white_out = auto_white_balance(RGB)  
R = RGB(:,:,1);      G = RGB(:,:,2);      B = RGB(:,:,3);  
  
R_ave = mean(mean(R));   
G_ave = mean(mean(G));   
B_ave = mean(mean(B));  

K_ave = (R_ave + G_ave + B_ave) / 3;  
R1 = (K_ave/R_ave)*R; 
G1 = (K_ave/G_ave)*G; 
B1 = (K_ave/B_ave)*B;   
RGB_white = cat(3, R1, G1, B1);  
RGB_white_out = uint8(RGB_white); 

end