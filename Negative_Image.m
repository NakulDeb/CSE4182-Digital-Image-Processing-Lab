clear
clear all
clc
original = imread('Images\Example3.1.png');

% Using For Onece
negative = 255 - original;

%Using For bit by bit
[n,m] = size(original);
for i=1:n
    for j=1:m
        negative2(i,j)=255-original(i,j);
    end
end

figure(1),imshow(original);title('Original image');
figure(2),imshow(negative);title('Negative image');
figure(3),imshow(negative2); title('Negative Image 2');