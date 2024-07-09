function [newimg]=equalization(img)
[R ,C ,D]=size(img);
if(D==3)
    for y=1:3
        freq=zeros(1,256);
        for i=1:R
            for j=1:C
            freq(img(i,j,y)+1)=freq(img(i,j,y)+1)+1;
            end
        end
        total=R*C;
        prob=freq/total;
        cum=zeros(1,256);
        cum(1)=prob(1);
        for i=2:256
            cum(i)=cum(i-1)+prob(i);
        end
        for i=1:R
            for j=1:C
                newimg(i,j,y)=round(cum(img(i,j,y)+1)*255);
            end
        end
    end
%     GRAY
else
freq=zeros(1,256);
for i=1:R
    for j=1:C
    freq(img(i,j)+1)=freq(img(i,j)+1)+1;
    end
end
total=R*C;
prob=freq/total;
cum=zeros(1,256);
cum(1)=prob(1);
for i=2:256
    cum(i)=cum(i-1)+prob(i);
end
for i=1:R
    for j=1:C
        newimg(i,j)=round(cum(img(i,j)+1)*255);
    end
end
end
newimg=uint8(newimg);
end