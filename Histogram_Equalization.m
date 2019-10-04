clear
clear all
clc
grayImage = imread('Images\Example4.2.png');

%grayImage = rgb2gray(image);
[m,n] = size(grayImage);
bitLevel = 8;
bitComb = (2^bitLevel);
histData = zeros(1,bitComb);

for i = 1:m
    for j = 1:n
        val = grayImage(i,j)+1;
        count = histData(val) + 1;
        histData(val) = count;
    end
end

max_pix_vec = max(grayImage(1:m,1:n));
min_pix_vec = min(grayImage(1:m,1:n));

max_pix = max(max_pix_vec);
min_pix = min(min_pix_vec);

for i = 1:m
    for j = 1:n
        streched_img(i,j) = (grayImage(i,j) - min_pix)*((bitComb - 1)/(max_pix - min_pix));
    end
end

histNewData = zeros(1,bitComb);

for i = 1:m
    for j = 1:n
        val = streched_img(i,j) + 1;
        count = histNewData(val) + 1;
        histNewData(val) = count;
    end
end

new_max_pix_vec = max(streched_img(1:m,1:n));
new_min_pix_vec = min(streched_img(1:m,1:n));

new_max_pix = max(new_max_pix_vec);
new_min_pix = min(new_min_pix_vec);

old_con = max_pix - min_pix;
new_con = new_max_pix - new_min_pix;


subplot(2,2,1)
stem(0:bitComb-1,histData); title('Old Image Histogram');

subplot(2,2,2)
imshow(grayImage); title('Old Image');

subplot(2,2,3)
stem(0:bitComb-1, histNewData); title('New Image Histogram');

subplot(2,2,4)
imshow(streched_img); title('New Image');
        
        
        
        
        
        
        
        