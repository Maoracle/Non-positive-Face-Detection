%函数功能：二次多项式法肤色分割

function imgdst=RGdetect(imgscr)

img_R=double(imgscr(:,:,1));
img_G=double(imgscr(:,:,2));
img_B=double(imgscr(:,:,3));

[h,w,d]=size(imgscr);
imgdst=zeros([h,w]);

for i=1:h
    for j=1:w
        
        if(img_R(i,j)>img_G(i,j) && img_G(i,j)>img_B(i,j))
            
            Sum=img_R(i,j)+img_G(i,j)+img_B(i,j);
            T1=156*img_R(i,j)-52*Sum;
            T2=156*img_G(i,j)-52*Sum;
            
            if(T1 * T1 + T2 * T2 >= (Sum * Sum)/16)
                T3 = 10000 * img_G(i,j) * Sum;
                Lower = - 7760 *img_R(i,j) * img_R(i,j) + 5601 * img_R(i,j)* Sum + 1766 * Sum * Sum; 
                
                if (T3 > Lower)                                         
                    
                        Upper = - 13767* img_R(i,j)* img_R(i,j) + 10743*img_R(i,j) * Sum + 1452* Sum * Sum;
                        if (T3 < Upper) 
                            
                             imgdst(i,j)=255;
                        end
                end
            end
        end
    end
end

%figure
%imshow(imgdst)
                        
                
                
            
            
            