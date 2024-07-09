function [newimg] = rayleighnoise(oldimg,a,b)
[R C L]=size(oldimg);
if(L==3)
    for i=0:255
       number_of_pixel=round((2/b)*(i-a)*(exp((-(i-a)*(i-a))/b)*R*C));
       for j=1:number_of_pixel
           row=ceil(rand(1,1)*R);
           column=ceil(rand(1,1)*C);
           for y=1:3
           newimg(row,column,y)=oldimg(row,column,y)+i;
           end
       end
    end
     %     contrust streching
%     for i=1:3
%         mn=min(min(newimg(:,:,i)));
%         mx=max(max(newimg(:,:,i)));
%         newimg(:,:,i)=((newimg(:,:,i)-mn)/(mx-mn))*255;
%     end
   
%     GRAY
else
    for i=0:255
          number_of_pixel=round((2/b)*(i-a)*(exp((-(i-a)*(i-a))/b)*R*C));
       for j=1:number_of_pixel
           row=ceil(rand(1,1)*R);
           column=ceil(rand(1,1)*C);
           newimg(row,column)=oldimg(row,column)+i;
       end
    end
end
%   newimg(:,:,i)=((newimg(:,:,i)-mn)/(mx-mn))*255;
        
end

