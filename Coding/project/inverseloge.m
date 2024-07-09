function [newimg] = inverseloge(oldimg,c)
newimg=im2double(oldimg);
oldimg=im2double(oldimg);
[R, C, D]=size(oldimg);
if(D==3)
    for i=1:R
        for j=1:C
            for k=1:3
            newimg(i,j,k)=(2^(oldimg(i,j,k)/c))-1;
            end
        end
    end
%     GRAY
else
    for i=1:R
        for j=1:C
            newimg(i,j)=(2^(oldimg(i,j)/c))-1;
        end
    end
    newimg=im2uint8(newimg);
end

