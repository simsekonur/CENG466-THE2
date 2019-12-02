A1 = imread('A1.png');
A2 = imread('A2.png');
A3 = imread('A3.png');


[M1,N1] = size(A1);
[M2,N2] = size(A2);
[M3,N3] = size(A3);

A1_t = fft2(A1);

center_x = round(M1/2);
center_y = round(N1/2);
filter1 = ones(M1, N1);
for x = 1:M1
   for y = 1:N1
      distance = sqrt((x-center_x)^2 + (y-center_y)^2);
      if((distance > 63 && distance < 85) || (distance > 280 && distance < 320))
         filter1(x, y) = 0;
      end
   end
end
filter1 = ifftshift(filter1); % shift back
A1_t = A1_t .* filter1; 
A1_new = ifft2(A1_t);

% Transformed values should be mapped.
A1_new = A1_new/255.0; % Adjust the color range to [0, 1]
% Map the gray levels to the range [0.0, 1.0]
A1_new = imadjust(A1_new, [min(A1_new(:)); max(A1_new(:))], [0.0; 1.0]);

figure, imshow(A1_new); % Display the output image 

