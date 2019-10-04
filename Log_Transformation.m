clear;
clear all;
clc;

img = imread('Images\Example6.png');
%C = input('Enter the value of constan : ');

l = 255;
C = l/(log(1+l));

[n,m] = size(img);
img = double(img);

for i=1:n
    for j=1:m
        s(i,j) = C*log(1+img(i,j));
    end
end


subplot(1,2,1);
imshow(uint8(img));title('Orginal Image');

subplot(1,2,2);
imshow(uint8(s)); title('After Log Transformation.');


