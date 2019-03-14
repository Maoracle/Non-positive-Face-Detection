%%%%%%%% multiple scales retinex %%%%%%%

function y=MSR(I)
Ir=I(:,:,1);  %分别提取图像的R分量,G分量和B分量
Ig=I(:,:,2);
Ib=I(:,:,3);

%%%%%%%%%%设定所需参数%%%%%%
% G = 192;
% b = -30;
% alpha = 125;
% beta = 46;

%%%%%%%%%%设定高斯参数%%%%%%
sigma_1=15;   %三个高斯核
sigma_2=80;
sigma_3=250;
[x,y]=meshgrid((-(size(Ir,2)-1)/2):(size(Ir,2)/2),(-(size(Ir,1)-1)/2):(size(Ir,1)/2));  
gauss_1=exp(-(x.^2+y.^2)/(2*sigma_1*sigma_1));  %计算高斯函数
Gauss_1=gauss_1/sum(gauss_1(:));  %归一化处理
gauss_2=exp(-(x.^2+y.^2)/(2*sigma_2*sigma_2));
Gauss_2=gauss_2/sum(gauss_2(:));
gauss_3=exp(-(x.^2+y.^2)/(2*sigma_3*sigma_3));
Gauss_3=gauss_3/sum(gauss_3(:));

%%%%%%%%%%对R分量操作%%%%%%%
Ir_double=double(Ir);
Ir_log=log(Ir_double+1);  %将图像转换到对数域
f_Ir=fft2(Ir_double);  %对图像进行傅立叶变换,转换到频域中

fgauss=fft2(Gauss_1,size(Ir,1),size(Ir,2));  %用0将图像填充至大小size(Ir,1)*size(Ir,2)
fgauss=fftshift(fgauss);  %将频域中心移到零点
Rr= ifft2(fgauss.*f_Ir);  %做卷积后变换回空域中
Rr_log= log(abs(Rr) + 1);
Rr1=Ir_log-Rr_log;  %sigam=15的处理结果

fgauss=fft2(Gauss_2,size(Ir,1),size(Ir,2));
fgauss=fftshift(fgauss);
Rr= ifft2(fgauss.*f_Ir);
Rr_log= log(abs(Rr) + 1);
Rr2=Ir_log-Rr_log;  %sigam=80

fgauss=fft2(Gauss_3,size(Ir,1),size(Ir,2));
fgauss=fftshift(fgauss);
Rr= ifft2(fgauss.*f_Ir);
Rr_log= log(abs(Rr) + 1);
Rr3=Ir_log-Rr_log;  %sigam=200

Rr=0.33*Rr1+0.34*Rr2+0.33*Rr3;   %加权求和
Rr=exp(Rr);  
min1=min(min(Rr));
max1=max(max(Rr));
Rr_final=(Rr-min1)*255/(max1-min1);  %线性拉伸
%figure,imshow(Rr_final,[]);

%%%%%%%%%%对G分量操作同R分量%%%%%%%
Ig_double=double(Ig);
Ig_log=log(Ig_double+1);
f_Ig=fft2(Ig_double);
fgauss=fft2(Gauss_1,size(Ig,1),size(Ig,2));
fgauss=fftshift(fgauss);
Rg= ifft2(fgauss.*f_Ig);
Rg_log= log(abs(Rg) + 1);
Rg1=Ig_log-Rg_log;
fgauss=fft2(Gauss_2,size(Ig,1),size(Ig,2));
fgauss=fftshift(fgauss);
Rg= ifft2(fgauss.*f_Ig);
Rg_log= log(abs(Rg) + 1);
Rg2=Ir_log-Rg_log;
fgauss=fft2(Gauss_3,size(Ig,1),size(Ig,2));
fgauss=fftshift(fgauss);
Rg= ifft2(fgauss.*f_Ig);
Rg_log= log(abs(Rg) + 1);
Rg3=Ig_log-Rg_log;
Rg=0.33*Rg1+0.34*Rg2+0.33*Rg3;
Rg=exp(Rg);
min2=min(min(Rg));
max2=max(max(Rg));
Rg_final=(Rg-min2)*255/(max2-min2);
%figure,imshow(Rg_final,[]);

%%%%%%%%%%对B分量操作同R分量%%%%%%%
Ib_double=double(Ib);
Ib_log=log(Ib_double+1);
f_Ib=fft2(Ib_double);
fgauss=fft2(Gauss_1,size(Ib,1),size(Ib,2));
fgauss=fftshift(fgauss);
Rb= ifft2(fgauss.*f_Ib);
Rb_log= log(abs(Rb) + 1);
Rb1=Ib_log-Rb_log;
fgauss=fft2(Gauss_2,size(Ib,1),size(Ib,2));
fgauss=fftshift(fgauss);
Rb= ifft2(fgauss.*f_Ib);
Rb_log= log(abs(Rb) + 1);
Rb2=Ir_log-Rb_log;
fgauss=fft2(Gauss_3,size(Ib,1),size(Ib,2));
fgauss=fftshift(fgauss);
Rb= ifft2(fgauss.*f_Ib);
Rb_log= log(abs(Rb) + 1);
Rb3=Ib_log-Rb_log;
Rb=0.33*Rb1+0.34*Rb2+0.33*Rb3;
Rb=exp(Rb);
min3=min(min(Rb));
max3=max(max(Rb));
Rb_final=(Rb-min3)*255/(max3-min3);
%figure,imshow(Rb_final,[]);

%%%%%%%%%
Final=cat(3,uint8(Rr_final),uint8(Rg_final),uint8(Rb_final));  %将三通道图像合并
% figure,imshow(I);  %显示原始图像
% figure,imshow(Final);  %显示处理后的图像
y=Final;











