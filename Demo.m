% ����ͼƬ
close all
clear all
yz=2000;
n=0;
t=66;
time=1;
RGB = imread(strcat(int2str(t),'.','jpg'));
figure(1),imshow(RGB)
title("ԭͼ")
pause(0.5)
I = rgb2gray(RGB);
se = strel('disk',200);
I2 = imbothat(I,se);  % ��ñ�任��ȥ�������ȱ���
figure(2),imshow(I2)
title("��ñ�˲�")
pause(time)
BW = im2bw(I2,0.2   );
figure(3),imshow(BW);
title("��ֵ��ͼ��")
pause(time)
se2 = strel('disk',20);
BW=imopen(BW,se2);
BW=imclose(BW,se2);
figure(4),imshow(BW);
title("��̬ѧ����")
pause(time)
[L,N] = bwlabel(BW);  % N��ΪĿ�����
n=N;
% ���Ŀ����
figure(5),imshow(RGB)
title("���չʾ")
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
% �Ի�����ʾĿ�������
h = dialog('Name','Ŀ�����','position',[580 300 220 100]);  % ����һ���Ի��򴰿�
uicontrol('Style','text','units','pixels','position',[45 40 120 50],'fontsize',15,'parent',h,'string',strcat('��',num2str(t),'��ͼ�ĵ���Ϊ',num2str(n),'��'));     % �����ı�����
uicontrol('units','pixels','position',[80 10 50 20],'fontsize',10,'parent',h,'string','ȷ��','callback','delete(gcf)'); % ������ȷ������ť


