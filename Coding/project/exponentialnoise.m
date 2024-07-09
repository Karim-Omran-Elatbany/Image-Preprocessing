
function [newimg] = exponentialnoise(oldimg,a)
[R C L]=size(oldimg);
if(L==3)
    for i=1:255
       number_of_pixel=round(a*(exp(-(a*i)))*R*C);
       for j=1:number_of_pixel
           row=ceil(rand(1,1)*R);
           column=ceil(rand(1,1)*C);
           for k=1:3
           newimg(row,column,k)=oldimg(row,column,k)+i;
           end
       end
    end

        %     contrust streching
for i=1:3
        mn=min(min(newimg(:,:,i)));
        mx=max(max(newimg(:,:,i)));
        newimg(:,:,i)=((newimg(:,:,i)-mn)/(mx-mn))*255;
    end

%     GRAY
else
    for i=1:255
         number_of_pixel=round(a*(exp(-(a*i)))*R*C);
       for j=1:number_of_pixel
           row=ceil(rand(1,1)*R);
           column=ceil(rand(1,1)*C);
           newimg(row,column)=oldimg(row,column)+i;
       end
    end

end
        newimg(:,:,i)=((newimg(:,:,i)-mn)/(mx-mn))*255;

end




