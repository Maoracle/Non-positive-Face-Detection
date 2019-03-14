function[imgOriginal, imgSkin, imgNonSkin] = finalMain(img)
imgOriginal = imread(img);
imgSkin = skindetect(imgOriginal);
imgSkin1 = skindetectycb(imgOriginal);
imgNonSkin = NonSkinDelete(imgSkin);
imgNonSkin1 = NonSkinDelete(imgSkin1);

figure(1);
title('原图');
imshow(imgOriginal);
figure(2);
title('颜色空间对比图');
subplot(2,2,1);
imshow(imgSkin);
subplot(2,2,2);
imshow(imgNonSkin);
subplot(2,2,3);
imshow(imgSkin1);
subplot(2,2,4);
imshow(imgNonSkin1);
plotLin(imgNonSkin);
% imgLin1 = plotLin(imgNonSkin1);
getNeckLineData(imgNonSkin);
% imgNeckLine1 = getNeckLineData(imgLin1);
