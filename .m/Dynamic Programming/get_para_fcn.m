function [A,net_box,Tur,L,R  ] = get_para_fcn( A,Tur )

%%��ȡ����
% 
% A=nan*ones(1,4);
% A(1)=1000;%����ˮ����
% A(2)=3;%װ��̨��
% A(3)=9.8;%���ˮͷ
% A(4)=7.5;%��Сˮͷ
% A(5)=0.5;%ˮͷ��ʧ


%ˮ�ֻ�Ч��������
net_box=cell(A(2),1);
net_box{1,1}=load('zz680.mat');
net_box{2,1}=load('zz680.mat');
net_box{3,1}=load('ZDK400_5.mat');

% 
% %ˮ�ֻ����ܵ�����
% n=A(2);
% Tur=nan*ones(n,8);
% Tur(1,1)=2;%ֱ��
% Tur(1,2)=214.3;%�ת��
% Tur(1,3)=1900;%�����
% Tur(1,4)=0.001;%ˮ�ֻ�Ч������
% Tur(1,5)=0.95;%�����Ч��
% Tur(1,6)=0.0008;%�ܵ�����ϵ��S
% Tur(1,7)=250;%��С����
% Tur(1,8)=0.8;%Ч��
% 
% Tur(2,1)=2;%ֱ��
% Tur(2,2)=214.3;%�ת��
% Tur(2,3)=1900;%�����
% Tur(2,4)=0.001;%ˮ�ֻ�Ч������
% Tur(2,5)=0.95;%�����Ч��
% Tur(2,6)=0.0008;%�ܵ�����ϵ��S
% Tur(2,7)=250;%��С����
% Tur(2,8)=0.8;%Ч��
% 
% Tur(3,1)=2.3;%ֱ��
% Tur(3,2)=187.5;%�ת��
% Tur(3,3)=2000;%�����
% Tur(3,4)=0.001;%ˮ�ֻ�Ч������
% Tur(3,5)=0.95;%�����Ч��
% Tur(3,6)=0.0008;%�ܵ�����ϵ��S
% Tur(3,7)=750;%��С����
% Tur(3,8)=0.8;%Ч��

L=cell(A(2),1);
R=cell(A(2),1);
data=xlsread('zz680.xlsx','left');
L{1,1}=data;
L{2,1}=data;

clear data

data=xlsread('zz680.xlsx','right');

R{1,1}=data;
R{2,1}=data;




clear data
data=xlsread('ZDK400_5.xls','left');
L{3,1}=data;
% L{2,1}=data;


clear data
data=xlsread('ZDK400_5.xls','right');
R{3,1}=data;
% R{2,1}=data;

clear data





end

