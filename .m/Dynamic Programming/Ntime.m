clc
clear all
num=xlsread('GX.xlsx','sheet3');%����������
U=800;%U��ʾ�����ֵ�������
% [M,N]=size(num);
% k=1;
% for i=1:N
%     for j=1:M
%         if num(j,i)~=0%����������������2��30�յļ�¼
%         data(k)=num(j,i);
%         k=k+1;
%         end
%     end
% end



data=num(:,5);
[T,X]=hist(data,U);
T=T';%Ƶ��
X=X';%��������ֵ
prob=T/sum(T);%ÿһ��������Ӧ�ĸ���
time=8760*prob;%ÿһ��������Ӧ��ʱ��
s_prob(1)=1-prob(1);%�ۻ�����P(Q>Q0)
for i=2:U
    s_prob(i)=s_prob(i-1)-prob(i);
end

data=data';

%��������֤������
figure(1);
plot(s_prob*100,X)
axis([0 100 0 max(X)]);
set(gca,'FontName','Times New Roman','FontSize',14)%����������̶��������ƣ���С
xlabel('��֤��(%��','fontsize',14);
ylabel('����(��λ��kw)','fontsize',14);
set(gcf,'color','w');
grid on 

%��Ƶ��--����ͳ��ͼ
figure(2)
K=length(data);
hist(data(1:K,1),150);figure(gcf);
set(gca,'FontName','Times New Roman','FontSize',14)%����������̶��������ƣ���С
xlabel('����(��λ��kw)','fontsize',14);
ylabel('Ƶ��','fontsize',14);
set(gcf,'color','w');
grid on