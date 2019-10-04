clear;
clear all;
clc;

img = imread('Images\Example3.1.png');
C = input('Enter the value of constan : '); % 1
g = input('Enter the value of gma : ');       % 1.2

[n,m] = size(img);
img = double(img);

for i=1:n
    for j=1:m
        s(i,j) = img(i,j)^g;
    end
end


subplot(1,2,1);
imshow(uint8(img));title('Orginal Image');

subplot(1,2,2);
imshow(uint8(s)); title('After Power Law Transformation.');


