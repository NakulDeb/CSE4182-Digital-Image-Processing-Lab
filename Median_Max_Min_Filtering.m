clc;
clear all;
close all;
img1 = imread('Images\circuit_board_2.png');
img1 = rgb2gray(img1);
img = imnoise(img1,'salt & pepper',0.01);
img = double(img);

%noise = imnoise(img,'salt & pepper',0.1);
%figure; imshow(uint8(noise));

k = input('Enter size of Filter : ');
[n,m] = size(img);

fr = floor(k/2);
fr = fr+1;


for i=1:n
    for j=1:m
        window = zeros(k*k,1);
        x = 1;
        for p=i-(fr-1):i+fr-1
            if(p<1)  %At the edges of an image we are missing pixels to form a neighbourhood.
                p = 1;
            end
            if(p>n) 
                p = n;
            end
            for q=j-(fr-1):j+fr-1
                if(q<1) 
                    q = 1;
                end
                if(q>m)
                    q = m;
                end
                window(x) = img(p,q);
                x = x+1;
            end
        end
        med = sort(window);
        medfilted(i,j) = double(med(fr));
        minfilted(i,j) = double(med(1));
        maxfilted(i,j) = double(med(k*k));
    end
end

figure; imshow(uint8(img1)); title('Original Image');
figure; imshow(uint8(img)); title('After Adding salt & pepper noise');
figure; imshow(uint8(medfilted)); title('After Median Filter');


figure; imshow(uint8(minfilted)); title('After Min Filter');
figure; imshow(uint8(maxfilted)); title('After Max Filter');