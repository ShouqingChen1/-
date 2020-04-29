function [ Q_LR ] = zbianjie_cal( L,R,Tur,A,H,U)
%����߽�����


q_lr=nan*ones(A(2),2);
for i=1:A(2)
n11=Tur(i,2)*Tur(i,1)/H^0.5;
    if length(L{i,1}(:,1))>=2
        q_lr(i,1)=interp1(L{i,1}(:,1),L{i,1}(:,2),n11,'linear','extrap');              
    else
        q_lr(i,1)=0;
    end
    
    if length(R{i,1}(:,1))>=2
        q_lr(i,2)=interp1(R{i,1}(:,1),R{i,1}(:,2),n11,'linear','extrap');     
    else
        q_lr(i,2)=0;
    end
    
    if q_lr(i,1)*q_lr(i,2)==0
        q_lr(i,2)=max(q_lr(i,1),q_lr(i,2));
        q_lr(i,1)=q_lr(i,2);
    end      
end

%�����ھ��任
DR=Tur(:,1);%ˮ�����ֱ��
ri=DR.^2*H^0.5/1000;
RI=[ri,ri];
Q_LR=q_lr.*RI;

qmax=Tur(:,3)./Tur(:,8)/9.81/H;%����ʶ�Ӧ����
Q_LR(:,2)=transpose(min(transpose([Q_LR(:,2),qmax])));
Q_LR=Q_LR.*[U;U]';




end
