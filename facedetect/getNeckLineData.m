function[s,t] = getNeckLineData(skingh)%��ȡ����������������ɢ����������
BW = edge(skingh,'canny');
[Lin,num]=bwlabel(BW,8);
[x,y]=find(Lin==1);
s = x(x>250);
t = y(x>250);%ȡ�°벿��
s = s(t<250);
t = t(t<250);%ȡ��벿��
s = s(s<380);
t = t(s<380);%�޳��ײ�����
figure,plot(s,t,'*');
xlabel('x');
ylabel('y');