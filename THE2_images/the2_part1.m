A1 = imread('A1.png');
A2 = imread('A2.png');
A3 = imread('A3.png');


[M1,N1] = size(A1);
[M2,N2] = size(A2);
[M3,N3] = size(A3);



A1_fs = fftshift(fft2(A1));
filter1 = ones(M1,N1);

dist1min = 280;
dist1max = 320;
dist2min = 65;
dist2max = 85;

midi=(M1-1)/2;
midj=(N1-1)/2;

%maxdistance = 0 ;

for i=1:M1
    for j=1:N1
        
        % distance from image center to pixel i, j
        distance = ((i - midi).^2 + (j - midj).^2).^0.5;
        
        
        if (distance >337)
            filter1(i, j) = 0;
        end
       
    end
end

A1_output = ifft2(ifftshift(A1_fs .* filter1));


figure ,imshow(uint8(real(A1_output)));
