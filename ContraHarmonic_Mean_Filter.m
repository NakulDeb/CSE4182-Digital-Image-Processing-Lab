clc
clear all
im = imread('Images\image.png');
gs = rgb2gray(im);
figure(1),imshow(gs),title('Original Image');

ngs = imnoise(gs, 'salt & pepper',0.01);
figure(2),imshow(ngs),title('After Adding salt & pepper noise');

data=im2double(ngs);
masksize=3;

Q=-2; % If Q = Positive(+) Then it Remove peper noise
     % If Q = Nagative(-) Then it Remove salt noise

sumn=[];
sumd=[];
figure,imshow(data)
pixln=0;
pixld=0;
[ro col]=size(data);

for i=1:ro;
    for j=1:col;
        for m=-masksize:masksize;
            for n=-masksize:masksize;
                if (i+m>0 && i+m<ro && j+n>0 && j+n<col && masksize+m>0 && masksize+m<ro && masksize+n>0 && masksize+n<col) 
                    pixl1=(data(i+m,j+n)).^(Q+1);                   
                    pixl2= (data(i+m,j+n)).^Q;
                    pixln=pixln+pixl1;                              
                    pixld=pixld+pixl2;
                
                end
            end
        end
       reformedimage(i,j)=(pixln/pixld);
       pixln=0;
       pixld=0;
    end
end
figure(3),imshow(reformedimage),title('After Applying Contra Harmonic Mean Filter');
