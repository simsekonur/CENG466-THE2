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



filter1 = ones(M1,N1);

center_x = (M1-1)/2;
center_y = (N1-1)/2;

maxdistance = 0;
min = 0;

for x=1:M1
   for y=1:N1
       
       distance = sqrt((x-center_x)^2+(y-center_y)^2);
       if (distance >maxdistance)
           maxdistance = distance;
       end 
       if((distance >430)&&(distance< 450)) % try to find the best one
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
       if((distance > 60 && distance < 85) || (distance > 280 && distance < 320))  % 250 looks better
           filter2(x,y)=0;
       end
   end 
end

filter2 = ifftshift(filter2);
A2_t = A2_t .* filter2;

A2_new = abs(ifft2(A2_t));
A2_new = A2_new / 255.0;

A2_new = imadjust(A2_new);

%figure , imshow(A2_new)

%figure, imshow(fftshift(fft2((abs(A2_new)))), [0, 40000])








%maxdistance = 0 ;
%try a different approach
redChannel = A3_t(:,:,1);
greenChannel = A3_t(:,:,2);
blueChannel = A3_t(:,:,3);

[M4,N4] = size(redChannel);%2 by2 matrix
[M5,N5] = size(greenChannel);
[M6,N6] = size(blueChannel);



center_x = (M4-1)/2;
center_y = (N4-1)/2;
filter3 = ones(M4,N4);
for x=1:M4
   for y=1:N4
        
            distance = sqrt((x-center_x)^2+(y-center_y)^2);
            
            if((distance >48 && distance < 60)  )
                filter3(x,y)=0;
            end
        
   end 
end

filter3 = ifftshift(filter3);
redChannel= redChannel .* filter3;

redChannel_new = abs(ifft2(redChannel));
redChannel_new= redChannel_new/ 255.0;


center_x = (M5-1)/2;
center_y = (N5-1)/2;
filter3 = ones(M5,N5);
for x=1:M5
   for y=1:N5
        
            distance = sqrt((x-center_x)^2+(y-center_y)^2);
            
            if((distance >48 && distance < 60) )
                filter3(x,y)=0;
            end
        
   end 
end

filter3 = ifftshift(filter3);
greenChannel= greenChannel .* filter3;

greenChannel_new = abs(ifft2(greenChannel));
greenChannel_new= greenChannel_new/ 255.0;


center_x = (M6-1)/2;
center_y = (N6-1)/2;
filter3 = ones(M6,N6);
for x=1:M6
   for y=1:N6
        
            distance = sqrt((x-center_x)^2+(y-center_y)^2);
            
            if((( distance >48 && distance < 60 ) ))
                filter3(x,y)=0;
            end
        
   end 
end

filter3 = ifftshift(filter3);
blueChannel= blueChannel .* filter3;

blueChannel_new = abs(ifft2(blueChannel));
blueChannel_new= blueChannel_new/ 255.0;


redChannel_new = imadjust(redChannel_new);
greenChannel_new = imadjust(greenChannel_new);
blueChannel_new = imadjust(blueChannel_new);



A3_new(:,:,1) = redChannel_new;
A3_new(:,:,2) = greenChannel_new;
A3_new(:,:,3) = blueChannel_new;




%figure , imshow(A3_new);
