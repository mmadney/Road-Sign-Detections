function [ Result ] = detect( image,im1,im2,im3,im4 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[W H L]=size(image);
image=rgb2gray(image);
image=imbinarize(image);
image=imcomplement(image);

Newim1=imresize(im1,[W,H]);
Newim1=rgb2gray(Newim1);
Newim1=imbinarize(Newim1);

Newim2=imresize(im2,[W,H]);
Newim2=rgb2gray(Newim2);
Newim2=imbinarize(Newim2);
Newim2=imcomplement(Newim2)

Newim3=imresize(im3,[W,H]);
Newim3=rgb2gray(Newim3);
Newim3=imbinarize(Newim3);

Newim4=imresize(im4,[W,H]);
Newim4=rgb2gray(Newim4);
Newim4=imbinarize(Newim4);

vector=[0,1;0,2;0,3;0,4];
x=5;
subim1=imsubtract(image,Newim1);
for i=1:W
    for j=1:H
        if(subim1(i,j,:)==1)
            vector(1)=vector(1)+1;
        end
            
    end
end
subim2=imsubtract(image,Newim2);
for i=1:W
    for j=1:H
        if(subim2(i,j,:)==1)
            vector(2)=vector(2)+1;
        end
            
    end
end

subim3=imsubtract(image,Newim3);
for i=1:W
    for j=1:H
        if(subim3(i,j,:)==1)
            vector(3)=vector(3)+1;
        end
            
    end
end

subim4=imsubtract(image,Newim4);
for i=1:W
    for j=1:H
        if(subim4(i,j,:)==1)
            vector(4)=vector(4)+1;
        end
            
    end
end
test=vector;
vector=sortrows(vector,1);
if(vector(1,2)==1)
    Result='NoEntry';
elseif(vector(1,2)==2)
        Result='NoTurnLeft';
elseif(vector(1,2)==3)
    Result='PassingPorihibited';
else
    Result='NoParking';
        
end
end

