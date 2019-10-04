clc;
clear all;
close all;
img = imread('Images\Bit_Plan_Slicing_1.png');

dimg = double(img);
s= 1;


b1 = mod(floor(dimg/1),2);
subplot(2,4,1);imshow(b1); title('Bit Plane 1');

b2 = mod(floor(dimg/2),2);
subplot(2,4,2);imshow(b2); title('Bit Plane 2');

b3 = mod(floor(dimg/4),2);
subplot(2,4,3);imshow(b3); title('Bit Plane 3');

b4 = mod(floor(dimg/8),2);
subplot(2,4,4);imshow(b4); title('Bit Plane 4');

b5 = mod(floor(dimg/16),2);
subplot(2,4,5);imshow(b5); title('Bit Plane 5');

b6 = mod(floor(dimg/32),2);
subplot(2,4,6);imshow(b6); title('Bit Plane 6');

b7 = mod(floor(dimg/64),2);
subplot(2,4,7);imshow(b7); title('Bit Plane 7');

b8 = mod(floor(dimg/128),2);
subplot(2,4,8);imshow(b8); title('Bit Plane 8');

%Combining images
%z = b1+(b2*2)+(b3*4)+(b4*8)+(b5*16)+(b6*32)+(b7*64)+(b8*128);
z = 2*(2*(2*(2*(2*(2*(2*b8+b7)+b6)+b5)+b4)+b3)+b2)+b1;

% % Using Loop
% z = mod(dimg,2);
% z = 0;
% for i=1:8
%     bit_plane = mod(floor(dimg/(2^(i-1))),2); % Right Shift by One Bit(Floor to make Binary Image )
%     %subplot(2,4,i);
%     %figure;
%     %imshow(bit_plane);title(['Bit Plane ',num2str(s)]);
%     s = s+1;
%     %For Loop combining 
%     z =  z+bit_plane*(2^(i-1));
%     
% end

figure;imshow(img);title('Original Image');
figure;imshow(uint8(z));title('Combined all Image');
