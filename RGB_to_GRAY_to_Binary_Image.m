clear
clear all
clc
image = imread('Images\image.png');

red = image(:, :, 1);
green = image(:, :, 2);
blue = image(:, :, 3);
[r, c, ~] = size(image);
gray = uint8(zeros(r,c));

for i=1:r
     for j=1:c
         gray(i,j)=(red(i,j)*0.2989+green(i,j)*0.5870+blue(i,j)*0.114);
     end
 end

gray1 = double(gray);

sum = 0;

for i = 1:r
    for j = 1:c
	sum = sum + gray1(i,j);
    end
end

threshold = sum / (r*c);

binary = zeros(r,c);

for i = 1:r
    for j = 1:c
        if(gray1(i,j) >= threshold)
            binary(i,j) = 1;
        end
    end
end
figure;
imshow(image);
title('Original image');

figure;
imshow(gray);
title('Gray image');

figure;
imshow(binary);
title('Binary image');%imshow(binaryImage);