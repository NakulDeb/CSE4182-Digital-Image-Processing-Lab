% Problem : Take grayscale image of size 512*512., add some salt & pepper noise. Apply Average and Median Spatial Filters with 5*5 mask and observe their performance for noise suppression tn term of PSNR

clc;
clear;
clear all;
img = imread('Images\circuit_board_2.png');
img = rgb2gray(img);
figure(1),imshow(img),title('Orginal Image');

img = imnoise(img,'salt & pepper',0.01);
figure(2),imshow(img),title('After Adding Salt and Pepper noise');
[h,w] = size(img);
mask_size = input('Enter The Mask Size : ');
to_pad = (mask_size - 1) / 2;

pgs = uint8(zeros(h + mask_size - 1, w + mask_size - 1)); 
pgs(to_pad + 1 : h + to_pad, to_pad + 1 : w + to_pad) = img;


asf = img;
median_im = double(zeros(h, w));
for i = to_pad + 1 : h +  to_pad - 1
    for j = to_pad + 1 : w + to_pad - 1
        s = sum(sum(pgs(i - to_pad : i + to_pad, j - to_pad : j + to_pad)));
        av = s / (mask_size * mask_size);
        asf(i - to_pad, j - to_pad) = av; 
        
        med = double(median(pgs(i - to_pad : i + to_pad, j - to_pad : j + to_pad)));
        med = sort(med);
        [y,x] = size(med);
        k = med(uint8(x/2));
        median_im(i - to_pad, j - to_pad) = double(k);
    end
end

figure(3),imshow(asf),title('After Appling Average Spatial filter');
figure(4),imshow(uint8(median_im)),title('After Appling Median Spatial filter');