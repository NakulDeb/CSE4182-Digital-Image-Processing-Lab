clc;
clear;
clear all;
img = imread('images\image.png');
img = rgb2gray(img);
figure(1),imshow(img),title('Orginal Image');

x = 150;
y = 200;

[n,m] = size(img);
for i=1:n
    for j=1:m
        if(img(i,j)>x && img(i,j)<y)
            img(i,j) = img(i,j)+30;
        end
    end
end

figure(2),imshow(img),title('After Brightness Enhancement');

