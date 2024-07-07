% 载入图片
close all
clear all
yz=2000;
n=0;
t=66;
time=1;
RGB = imread(strcat(int2str(t),'.','jpg'));
figure(1),imshow(RGB)
title("原图")
pause(0.5)
I = rgb2gray(RGB);
se = strel('disk',200);
I2 = imbothat(I,se);  % 底帽变换，去除不均匀背景
figure(2),imshow(I2)
title("底帽滤波")
pause(time)
BW = im2bw(I2,0.2   );
figure(3),imshow(BW);
title("二值化图像")
pause(time)
se2 = strel('disk',20);
BW=imopen(BW,se2);
BW=imclose(BW,se2);
figure(4),imshow(BW);
title("形态学处理")
pause(time)
[L,N] = bwlabel(BW);  % N即为目标个数
n=N;
% 标记目标物
figure(5),imshow(RGB)
title("标记展示")
hold on
for k = 1:N
    [r,c] = find(L == k);
    a=size(r);
    if a(1)<yz
        n=n-1;
    else
        rbar = mean(r);
        cbar = mean(c);  
        plot(cbar,rbar,'marker','o','markeredgecolor','r','markersize',10);
        text(cbar,rbar,num2str(a(1)))
    end
end
% 对话框显示目标物个数
h = dialog('Name','目标个数','position',[580 300 220 100]);  % 创建一个对话框窗口
uicontrol('Style','text','units','pixels','position',[45 40 120 50],'fontsize',15,'parent',h,'string',strcat('第',num2str(t),'张图的点数为',num2str(n),'个'));     % 创建文本内容
uicontrol('units','pixels','position',[80 10 50 20],'fontsize',10,'parent',h,'string','确定','callback','delete(gcf)'); % 创建【确定】按钮


