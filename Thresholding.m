clear
clear all
clc
image = imread('Images\Example3.2.png');

[r,c] = size(image);
s = image;
for i=1:r
    for j=1:c
        if(s(i,j)<100)
            s(i,j) = 1;
        end
    end
end


figure(1),imshow(image);title('Original image');

figure(2),imshow(s);title('Thresholding image');

%It is the main function for thresholding.
l = 50;
threshimg = image>l;

figure(3),imshow(threshimg);title('Thresholding Image.');



