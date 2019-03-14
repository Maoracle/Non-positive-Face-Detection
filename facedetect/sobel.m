function [imgdst]=sobel(imag)
imag = rgb2gray(imag);        %ת��Ϊ�Ҷ�ͼ
%subplot(121);imshow(imag):title('ԭͼ'); 
[high,width] = size(imag);   % ���ͼ��ĸ߶ȺͿ��
%F2 = double(imag);        
U = double(imag);       
uSobel = imag;
for i = 2:high - 1   %sobel��Ե���
    for j = 2:width - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + U(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + U(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + U(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + U(i+1,j-1));
        uSobel(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end 

imgdst = uSobel;
%subplot(122);imshow(im2uint8(uSobel)):title('��Ե����');  %������Ե�����ͼ��
% Matlab�Դ�������Ե���
% KΪ��ȡ�õ��Ĺؼ�֡�ĻҶ�ͼ
%thresh=[0.01,0.10];
%sigma=2;
%BW3 = edge(imag,'canny', thresh,sigma);
%subplot(123);imshow(BW3,[]):title('Matlab�Դ�������Ե���');