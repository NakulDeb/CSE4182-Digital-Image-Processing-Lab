clc;
clear all;
close all;
img = imread('Images\image.png');
img = rgb2gray(img);

figure(1),imshow(uint8(img)); title('Original Image');

img = imnoise(img,'salt & pepper',0.01);
figure(2),imshow(uint8(img)); title('After Adding salt & pepper Noise');

img = double(img);
k = input('Enter size of Mask : ');

for i=1:k
    for j=1:k
        avf(i,j) = 1/(k*k);
    end
end

[n,m] = size(img);

sum = 0;
fr = floor(k/2);
fr = fr+1;

%n = floor(n-k/2);
%m = floor(m-k/2);

for i=1:n
    for j=1:m
        sum = 0;
        x = 1;
        for p=i-(fr-1):i+fr-1
            if(p<1)  %At the edges of an image we are missing pixels to form a neighbourhood.
                p = 1;
            end
            if(p>n) %At the edges of an image we are missing pixels to form a neighbourhood

                p = n;
            end
            y=1;
            for q=j-(fr-1):j+fr-1
                if(q<1) %At the edges of an image we are missing pixels to form a neighbourhood
                    q = 1;
                end
                if(q>m) %At the edges of an image we are missing pixels to form a neighbourhood
                    q = m;
                end
                sum = sum+img(p,q)*avf(x,y);
                y = y+1;
            end
            x = x+1;
        end
        filtedImage(i,j) = double(sum);
    end
end


figure(3), imshow(uint8(filtedImage)); title('After Averaging Filter');