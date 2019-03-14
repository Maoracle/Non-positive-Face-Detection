# Non-positive-Face-Detection
Graduate research projects
人脸库（facelib这个文件夹中）：testlib:实验室环境下拍摄而得；
多姿态人脸库；
加州理工大学彩色人脸库，主要用于测试肤色模型的好坏。

以下文件在facedetect这个文件夹中
系统搭建平台：platform.m
主程序:main.m

光照补偿方法：
参考白算法；（rgbcompensation.m）
非线性变换法：(nolinetransaction.m)
三种色彩平衡算法（灰度世界算法、完美反射法、动态阈值法）：http://www.cnblogs.com/Imageshop/archive/2013/04/20/3032062.html

人脸检测：
高斯肤色模型（改进的）；(skindetect.m)
最大类间方差法；(Otsudetect.m)
非线性变换分段椭圆模型法；(nolinedetect.m)
二次多项式模型。（RGdetect.m）

形态学处理：
区域填充率、区域宽高比、区域面积大小判断；（NonskinDelete.m）
剔除脖子区域；
保留最大连通区域；
求取质心、长短轴等参数。（以上三部分在opencv中完成，在test文件夹中的test.cpp）

神经网络：（我没有做好，不值得参考）
整理的数据，
BP神经网络

脖子区域剔除方法：
曲线拟合法：（findLine.m)
遍历求取角度法：（myangle.m)


