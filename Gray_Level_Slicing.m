clc;
clear all;
close all;
img = imread('C:\Users\NAKUL DEB NATH\Desktop\CSE4182-Digital Image Processing Lab\Images\Gray_level_Slicing1.png');
img = rgb2gray(img);

without_background = uint8(img);
with_background = uint8(img);

[n,m] = size(without_background);
l = 256;

for i=1:n
    for j=1:m
        %With out BackGround
        if(without_background(i,j)>120 & without_background(i,j)<220)
            without_background(i,j) = l-1;
        else
            without_background(i,j) = 0;
        end
        
        %With BackGround
        if(with_background(i,j)>120 & with_background(i,j)<220)
            with_background(i,j) = l-1;
        end
    end
end
figure,imshow(img);title('Original Image');
figure;
imshow(without_background); title('Gray Level Slicing Without BackGround');

for i=1:n
    for j=1:m
        %With BackGround
        if(without_background(i,j)>120 & without_background(i,j)<220)
            without_background(i,j) = l-1;
        end
    end
end
figure;
imshow(with_background); title('Gray Level Slicing With BackGround');
