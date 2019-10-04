clc;
clear all;
close all;
img = imread('Images\circuit_board_2.png');
img = rgb2gray(img);
img = double(img);

%noise = imnoise(img,'salt & pepper',0.1);
%figure; imshow(uint8(noise));


k = 3;
wavf = [1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];
%wavf = [1/20 2/20 1/20; 2/20 8/20 2/20; 1/20 2/20 1/20];

k = 5;
wavf = [1/32 1/32 2/32 1/32 1/32
        1/32 1/32 4/32 1/32 1/32
        2/32 4/32 8/32 4/32 2/32
        1/32 1/32 4/32 1/32 1/32
        1/32 1/32 2/32 1/32 1/32];

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
                sum = sum+img(p,q)*wavf(x,y);
                y = y+1;
            end
            x = x+1;
        end
        filtedImage(i,j) = double(sum);
    end
end

subplot(1,2,1); imshow(uint8(img)); title('Original Image');
subplot(1,2,2); imshow(uint8(filtedImage)); title('After Averaging Filter');