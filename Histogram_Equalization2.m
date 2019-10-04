clear all;

gs = imread('Images\Example4.2.png');
%gs = rgb2gray(img);
%subplot(2,2,2),imshow(gs);

[w, h] = size(gs);
 
freq = zeros(1, 256);

count = 0;

for i = 1 : 256
    for j = 1 : w
        for k = 1 : h
            if gs(j, k) == i - 1
                count = count + 1;
            end
        end
    end
    freq(i) = count;
    count = 0;
end

 n = 0 : 255;

subplot(2,2,1),stem(n,freq); title('Old Image Histogram');
%he = histeq(gs);
subplot(2,2,2),imshow(gs);title('Old Image');


GIm = gs;
numofpixels=size(GIm,1)*size(GIm,2);
HIm=uint8(zeros(size(GIm,1),size(GIm,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);



for i=1:size(GIm,1)
    for j=1:size(GIm,2)
        value=GIm(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;
    end
end

sum=0;
no_bins=255;

for i=1:size(probf)
   sum=sum+probf(i);
   cum(i)=sum;
   %probc(i)=cum(i)/numofpixels;
   output(i)=round(cum(i)*no_bins);
end

for i=1:size(GIm,1)
    for j=1:size(GIm,2)
        HIm(i,j)=output(GIm(i,j) + 1);
    end
end

subplot(2,2,4),imshow(HIm),title('After Histogram equalization Image');

count = 0;
for i = 1 : 256
    for j = 1 : w
        for k = 1 : h
            if HIm(j, k) == i - 1
                count = count + 1;
            end
        end
    end
    freq(i) = count;
    count = 0;
end
subplot(2,2,3),stem(n,freq); title('After Histogram equalization ');