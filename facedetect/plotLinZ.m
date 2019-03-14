function[x,y] = plotLinZ(skingh)
BW = edge(skingh,'canny');
[Lin,num]=bwlabel(BW,8);
[x,y]=find(Lin==1);
% line = (max(x)-min(x))/3+min(x);
figure,plot(y,x,'*');
xlabel('x');
ylabel('y');
% hold on
% plot([x(line);x(line)])
