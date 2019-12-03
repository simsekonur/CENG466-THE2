A1 = imread('A1.png');
A2 = imread('A2.png');
A3 = imread('A3.png');


[M1,N1] = size(A1);
[M2,N2] = size(A2);
[M3,N3,Z3] = size(A3);

A1_t = fft2(A1);
%figure, imshow(fftshift(abs(A1_t)), [0, 40000])

A2_t = fft2(A2);
%figure, imshow(fftshift(abs(A2_t)), [0, 40000])

A3_t = fft2(A3);
%figure, imshow(fftshift(abs(A3_t)), [0, 40000])


filter1 = ones(M1,N1);

center_x = (M1-1)/2;
center_y = (N1-1)/2;



for x=1:M1
   for y=1:N1
       
       distance = sqrt((x-center_x)^2+(y-center_y)^2);
       if(distance > 24000)
           filter1(x,y)=0;
       end
   end 
end

filter1 = ifftshift(filter1);
A1_t = A1_t .* filter1;

A1_new = abs(ifft2(A1_t));
A1_new = A1_new / 255.0;
A1_new = imadjust(A1_new);
figure ,imshow(A1_new)




filter2 = ones(M2,N2);

center_x = (M2-1)/2;
center_y = (N2-1)/2;



for x=1:M2
   for y=1:N2
       distance = sqrt((x-center_x)^2+(y-center_y)^2);
       if(distance > 250)
           filter2(x,y)=0;
       end
   end 
end

filter2 = ifftshift(filter2);
A2_t = A2_t .* filter2;

A2_new = abs(ifft2(A2_t));
A2_new = A2_new / 255.0;
A2_new = imadjust(A2_new);
figure , imshow(A2_new)




filter3 = ones(M3,N3,Z3);

center_x = (M3-1)/2;
center_y = (N3-1)/2;
center_z = (Z3-1)/2;


for x=1:M3
   for y=1:N3
        for z=1:Z3
            distance = sqrt((x-center_x)^2+(y-center_y)^2);
            if(distance > 95)
                filter3(x,y,z)=0;
            end
        end 
   end 
end

filter3 = ifftshift(filter3);
A3_t = A3_t .* filter3;

A3_new = abs(ifft2(A3_t));
A3_new = A3_new / 255.0;

figure , imshow(A3_new)



