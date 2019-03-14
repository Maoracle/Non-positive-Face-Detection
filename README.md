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

神经网络：（我没有做好，不值得参考）（可以参考一下头势特征信号分类这个文件夹）
整理的数据，
BP神经网络

对test文件中的WEDlg.cpp文件中的函数作说明

1，打开报告日志文件，然后将信息写进日志中：
void log2File(const char * message1=NULL,int message2=-1,float message3=-1)

2，生成文件路径：
void CreatePathFile(char* path,char* name,char *type)
3，将图片保存进指定的路径下：
void saveImage(char* file_name,IplImage* src,char* expanded_name)

4，对二值化图像的最大连通区域拟合出一个圆，实现的效果如下，目的是在后面将这两幅图像相与，就可以去除环境中的类肤色区域


5，对二值化图像进行反转，即黑的变白的，白的变黑的：
void Inverse( IplImage* pImg )

6，用canny算子对灰度图像经行边缘检测，得到一幅二值化图像：
void Edge_Segment( IplImage* img,IplImage* pImg )

7，图像与运算：在一幅二值化图像中，白色区域用1表示，黑色区域用0表示，对两幅二值化图像进行与运算，能保留有效的人脸区域，突出有价值的边缘信息：
void ImgOverlying( IplImage* dst_crotsu, IplImage* edge_img)
8，计算整幅彩色图像R,G,B均值：
void SkinRGB(IplImage* rgb,IplImage* _dst)

9，最大类间方差法：输入的是灰度图像，输出的二值化图像
void cvThresholdOtsu(IplImage* src, IplImage* dst,int color_component)

10，用最大类间方差法对Cb，Cr两通道使用最大类间方差法
void cvSkinOtsu(IplImage* src, IplImage* dst0,IplImage* dst1)

11，计算整幅图像的Y,Cb,Cr三个通道的均值和方差，并保存在一个文件中：
void LogYUV(IplImage* src)

12，对一张二值图像，保留最大连通区域：
int findMaxContour(IplImage* src,IplImage* dst=NULL,int* x=NULL,int* y=NULL,int* MaxArea=NULL)

13，计算检测出来的人脸区域的Y，Cb，Cr的均值和方差：
void Skin(IplImage* src1,IplImage* src2,IplImage* dst)

14，使用最大类间方差法对原彩色图像进行人脸检测，并进行边缘检测，保留最大连通区域，去除环境中的类肤色区域（即调用上面的函数功能）
int Qtsu_recogniton(IplImage* img,IplImage* dst_Qtsu)

15，使用自适应阈值分割法检测肤色（就要用到前面计算的人脸区域的均值、方差）
void cvSkinYUV(IplImage* src,IplImage* dst)

16，在自适应阈值分割法和最大类间方差法之间切换肤色模型（根据光找条件）
int myYUV(IplImage* img,IplImage* dst_Result)

17，给连通区域画框
void ReDrowContour(IplImage* src,IplImage* dst,int x,int y,int w_leftboundary,
int w_rightboundary,int h_upboundary,int h_downboundary)

18，用一个矩形（椭圆）拟合二值化连通区域，在前面画框之前
void RecProcess(IplImage* frame,int w_leftboundary,int w_rightboundary,int h_upboundary,int h_downboundary)

19，找到人脸区域并找到质心位置
int SkinProcess(IplImage* frame)


