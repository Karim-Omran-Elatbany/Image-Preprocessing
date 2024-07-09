function [new_image] = LOG(Old_image,Option)%option=log or inverse log

[H W L]=size(Old_image); %define size of old image
log_rgb=zeros(H,W); %initialize rgb with zero values
log_gray=zeros(H,W); %initialize gray with zero values
Old_image=im2double(Old_image);

for i=1:H
    for j=1:W
        if Option==1 %log
            if L==3
                log_rgb(i,j,1)=log((Old_image(i,j,1))+1);
                log_rgb(i,j,2)=log((Old_image(i,j,2))+1);
                log_rgb(i,j,3)=log((Old_image(i,j,3))+1);
            else
               log_gray(i,j)=log((Old_image(i,j))+1) ;
            end
        elseif Option==2 %inverse log
            if L==3
                log_rgb(i,j,1)=exp(Old_image(i,j,1)-1);
                log_rgb(i,j,2)=exp(Old_image(i,j,2)-1);
                log_rgb(i,j,3)=exp(Old_image(i,j,3)-1);
            else
               log_gray(i,j)=exp((Old_image(i,j))-1) ;

            end
        end   
    end
end
log_rgb=im2uint8(log_rgb);
if L==3
    new_image=log_rgb;
end
if L==1
    log_gray=im2uint8(log_gray);
    new_image=log_gray;
end


end

