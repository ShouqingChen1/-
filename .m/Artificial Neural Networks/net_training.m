clc
clear all
num=xlsread('ZZA324.xlsx','eta');

M=length(num(:,1));
N=floor(M/2);%ȡ������
for i=1:N
    P0(i)=num(2*i,1);%ѵ������N11������ֵ��
    P1(i)=num(2*i,2);%ѵ������Q11������ֵ��
    T(i)=num(2*i,3);%ѵ������ITA�����ֵ��
    Ptest0(i)=num(2*i-1,1);%��������N11
    Ptest1(i)=num(2*i-1,2);%��������Q11
    Ttest(i)=num(2*i-1,3);%��������ITA
   
end
P=[P0',P1']';
Ptest=[Ptest0',Ptest1']';
net_zh=newff(minmax(P),[8,7,1],{'logsig','logsig','purelin'},'trainlm');
net_zh.trainParam.show=200;
net_zh.trainParam.epochs=3000;%����������
net_zh.trainParam.goal=1e-9;%Ŀ��������
net_zh.trainParam.min_grad=1e-10;
[net_zh,tr]=train(net_zh,P,T);%ѵ������
rtest=sim(net_zh,P);%ѵ�����������������
rdelta=rtest-T;%ѵ�������������������ʵ��ֵ�����
result_test=sim(net_zh,Ptest);%�������������������
delta=result_test-Ttest;%���������������������ʵ��ֵ�����
 plot(delta)%���������������ͼ
figure(3)
plot(P1,P0,'ro')
hold on
plot(Ptest1,Ptest0,'b*')
