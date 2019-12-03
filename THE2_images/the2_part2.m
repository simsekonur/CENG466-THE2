B1 = imread('B1.jpg');
B2 = imread('B2.jpg');



[M1,N1,Z1] = size(B1);
[M2,N2,Z2] = size(B2);


B1_t = fft2(B1);
%figure, imshow(fftshift(abs(A1_t)), [0, 40000])

B2_t = fft2(B2);
%figure, imshow(fftshift(abs(A2_t)), [0, 40000])



center_x = (M1-1)/2;
center_y = (N1-1)/2;
center_z = (Z1-1)/2;
filter1 = zeros(M1,N1,Z1);

for x=1:M1
   for y=1:N1
       for z=1:Z1
        distance = sqrt((x-center_x)^2+(y-center_y)^2+(z-center_z)^2);
        if(distance> 48)
            filter1(x,y,z)=1;
           
        end
       end 
   end 
end 

filter1 = ifftshift(filter1);
B1_t = B1_t .* filter1 ;
B1_new = abs(ifft2(B1_t));

B1_new = B1_new/255.0;

B1_new = imadjust(B1_new,[min(B1_new(:)); max(B1_new(:))],[0.0; 1.0]);

imwrite(B1_new,'B1_output.jpg');





center_x = (M2-1)/2;
center_y = (N2-1)/2;
center_z = (Z2-1)/2;
filter2 = zeros(M2,N2,Z2);

for x=1:M2
   for y=1:N2
       for z=1:Z2
        distance = sqrt((x-center_x)^2+(y-center_y)^2+(z-center_z)^2);
        if(distance> 60)
            filter2(x,y,z)=1;
           
        end
       end 
   end 
end 

filter2 = ifftshift(filter2);

B2_t = B2_t .* filter2 ;

B2_new = abs(ifft2(B2_t));

B2_new = B2_new/255.0;

B2_new = imadjust(B2_new,[min(B2_new(:)); max(B2_new(:))],[0.0; 1.0]);

imwrite(B2_new,'B2_output.jpg');


