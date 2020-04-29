function [ v,eta] = zSubObjF( k,q_lr,u,net_box,Tur,H,L,R)

S=Tur(k,6);
price=1;%���
pf=-1000000;%�ͷ�����

qmin=q_lr(k,1);%k̨������С��ˮ����
qmax=q_lr(k,2);%k̨���������ˮ����
n=length(u);
qd=nan*ones(n,1);%k̨������ˮ����
qd(u<qmin)=0;
qd(u>=qmax)=qmax;
index=u>=qmin&u<qmax;
qd(index)=u(index);
Hd=H*ones(n,1);
hsun=0.5;%S*qd.^2;
HHB=Hd-hsun;%��ˮͷ

n11=Tur(k,2)*Tur(k,1)./HHB.^0.5;
q11=1000*qd./HHB.^0.5/Tur(k,1).^2;


etax=transpose(sim(net_box{k,1}.net_zh,[n11';q11'])+Tur(k,4));



eta=etax+Tur(k,4);
b=0.931;
eta(eta>b)=b;


etag=Tur(k,5)*ones(n,1);%�����Ч��
N=9.81*qd.*HHB.*eta.*etag;
v=price*N+pf*abs(u-qd);


% 
% 

end

