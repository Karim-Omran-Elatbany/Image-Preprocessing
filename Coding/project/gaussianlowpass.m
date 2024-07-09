function[output_img]= gaussianlowpass(image,D0)
[R C D]=size(image);
FT_img=fft2(image);
FT_img=fftshift(FT_img);
filter=zeros(R,C);
  
for i=1:R
    for j=1:C
        dis=sqrt((((R/2)-i)^2)+(((C/2)-j)^2));
            filter(i,j)=(exp(1))^(-(dis*dis)/(2*D0*D0));
    end
end
G=filter.*FT_img;
output_img=fftshift(G);
output_img=ifft2(output_img);
output_img=abs(output_img);
 output_img=log(1+output_img);
output_img=mat2gray(output_img);
end
