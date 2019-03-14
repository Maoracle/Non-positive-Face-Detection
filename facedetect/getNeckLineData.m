function[s,t] = getNeckLineData(skingh)%截取脖子区域两侧曲线散点坐标数据
BW = edge(skingh,'canny');
[Lin,num]=bwlabel(BW,8);
[x,y]=find(Lin==1);
s = x(x>250);
t = y(x>250);%取下半部分
s = s(t<250);
t = t(t<250);%取左半部分
s = s(s<380);
t = t(s<380);%剔除底部曲线
figure,plot(s,t,'*');
xlabel('x');
ylabel('y');