clc;
clear all;
close all;
img = imread('Images\Averaging_Filter1.png');
img = rgb2gray(img);
img = double(img);

%noise = imnoise(img,'salt & pepper',0.1);
%figure; imshow(uint8(noise));

k = input('Enter size of Filter : ');
%k = 3;
for i=1:k
    for j=1:k
        avf(i,j) = 1/(k*k);
    end
end

[n,m] = size(img);

sum = 0;
fr = floor(k/2);
fr = fr+1;

n = floor(n-k/2);
m = floor(m-k/2);


for i=fr:n
    for j=fr:m
        sum = 0;
        x = 1;
        for p=i-(fr-1):i+fr-1
            y=1;
            for q=j-(fr-1):j+fr-1
                sum = sum+img(p,q)*avf(x,y);
                y = y+1;
            end
            x = x+1;
        end
        filtedImage(i,j) = double(sum);
    end
end

subplot(1,2,1); imshow(uint8(img)); title('Original Image');
subplot(1,2,2); imshow(uint8(filtedImage)); title('After Averaging Filter');