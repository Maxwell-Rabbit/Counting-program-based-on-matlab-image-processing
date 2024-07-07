# 绪论

在很多的实验过程中，需要对实验样品进行计数，而人工计数的方式效率比较低，且容易计数错误。为了方便对样品进行计数，笔者设计了一套基于matlab图像处理的计数程序，以增加计数的效率和准确度。

# 图像的形态学处理

## 腐蚀和膨胀

### 腐蚀

腐蚀是将结构元素的中心置于图片的像素上，然后与图片进行“与”运算，该结构元素的中心要遍历图片的每一个像素，腐蚀操作会腐蚀掉图像外围的突出点。

### 膨胀

膨胀是将结构元素的中心置于图片的像素上，然后与图片进行“或”运算，该结构元素的中心要遍历图片的每一个像素，膨胀操作会将图像外围的突出点连接并向外延伸。

## 开操作和闭操作

### 开操作

图像的开操作是指对图片先进行腐蚀，再进行膨胀。开操作可以清除图像中的小物体；可以在图像的纤细点分离物体；可以平滑大物体的边界且不改变物体的体积，除此之外，开操作还可以用于提取水平以及竖直的线条。

### 闭操作

图像的闭操作是指对图像先进行膨胀，再进行腐蚀。闭操作可以填充物体内的小空洞；可以连接相邻的物体；可以平滑物体的边界且不改变物体的体积。

## 顶帽变换和底帽变换

### 顶帽变换

顶帽变换是用图像本身减去图像进行开操作之后的图像，该变换适用于暗背景下的亮物体，并且适用于矫正不均匀的光照。

### 底帽变换

底帽变换是用图像进行闭操作之后的图像减去图像本身，该变换适用于亮背景下的暗物体。

# 处理步骤

## 参数定义与设定

参数设定主要内容包括定义用于图像计数的阈值、设定文件所在的路径、定义用于底帽变换的结构元素以及定义用于顶帽变换的结构元素。

## 图片打开

将需要进行计数的图片打开，并在matlab中显示出来，本文档中使用的案例为在纸上放置的花生米，打开后的图片如下图。

![原图](.\原图.png)

## 底帽变换

将彩色图片转换为灰度图像，并对灰度图像进行底帽变换，将背景中的绝大部分干扰元素去除，经底帽变换后的图像如下图。

![底帽滤波](.\底帽滤波.png)

## 图像二值化

将经过底帽变换之后的图像进行二值化，经过二值化后，需要被计数的个体便变得十分突出明显。二值化后的结果如下图所示。

![二值化图像](.二值化图像.png)

## 形态学处理

虽然二值化后的图像已经十分突出，但仍存在一些噪点需要处理，因此对图像进行一次开操作以去除小噪点，并对开操作之后的图像进行一次闭操作平滑被计数物体。形态学处理后的图像如下图。

![形态学处理](.\形态学处理.png)

## 图像计数

对形态学处理后的图像进行计数，为了增强计数的准确性，在计数时设定了阈值，将每个被计数区域的像素数量与阈值进行比较，若小于阈值则舍弃。最终会在原始图像上标记每一个被计数的物体，并显示像素点数量，同时会弹出对话框进行提示，程序运行结果如下图。

![结果](.\结果.png)