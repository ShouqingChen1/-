function [ p_opt ] = zdynprog( x,zDecisFun,zSubObjFun,TransFun,ObjFun,net_box,L,R,Tur,A,H,U )
%x״̬������һ�д���һ���׶�״̬����ʣ�෢�����������
% DecisFun(k,x)���߱���
% SubObjFun(k,x,u)�ǽ׶�ָ�꺯��
% TransFun(k,x,u)��״̬ת�ƺ���
% ObjFun(v,f)�ǵ�k�׶������׶�ָ�꺯��
%p_opt=[����飻���Ų����飻���Ź����飻ָ�꺯��ֵ��]��
%fval��һ������������Ԫ�طֱ��ʾp_opt�����Ų������Ӧʼ��״̬x�����ź���ֵ
%https://blog.csdn.net/u013527937/article/details/53140686

[ q_lr] = zbianjie_cal( L,R,Tur,A,H,U);
[M,N]=size(x);
k=N-1;
x_isnan=~isnan(x);
t_vubm=-inf*ones(M,k);%���Ž׶�ָ��
f_opt=-inf*ones(M,k);%�ۻ�ָ��
d_opt=f_opt;%�׶����ž��߱�������
eta_opt=nan*ones(M,k);
tmp1=find(x_isnan(:,k));
tmp2=length(tmp1);
for i=1:tmp2
    u=feval(zDecisFun,k,i,x);%������Լ���
    
    [tmp,eta]=feval(zSubObjFun,k,q_lr,u,net_box,Tur,H,L,R);
    
    f_opt(i,k)=tmp;
    d_opt(i,k)=u;
    t_vubm(i,k)=tmp;
    eta_opt(i,k)=eta;

end
for ii=k-1:-1:1
    tmp20=length( x(x_isnan(:,ii)));
    for i=1:tmp20

        u=feval(zDecisFun,ii,i,x);%������Լ���
        [tmp0,eta]=feval(zSubObjFun,ii,q_lr,u,net_box,Tur,H,L,R);
        tmp00=feval(ObjFun,tmp0,f_opt(:,ii+1));%���ƹ�ϵʽ
        [maxv,index]=max(tmp00);
        f_opt(i,ii)=maxv;%���Ų����ۻ�ָ��
        d_opt(i,ii)=u(index);%���Ų���uk
        t_vubm(i,ii)=tmp0(index);)
        eta_opt(i,ii)=eta(index);
        
        
    end
end

tmpx=nan*ones(1,k);
tmpd=nan*ones(1,k);
tmpf=nan*ones(1,k);
tmpe=nan*ones(1,k);

p_opt=nan*ones(5,k);
[Emax,index]=max(f_opt(:,1));
p_opt(1,1)=Emax;
p_opt(2,1)=x(index,1);
p_opt(3,1)=d_opt(index,1);
p_opt(4,1)=t_vubm(index,1);
p_opt(5,1)=eta_opt(index,1);

tmpd(1)=d_opt(index,1);
tmpx(1)=x(index,1);
tmpf(1)=t_vubm(index,1);
tmpe(1)=eta_opt(index,1);

for ii=2:k
    
    tmpx(ii)=feval(TransFun,ii,tmpx(ii-1),tmpd(ii-1));
    tmp1=abs(x(:,ii)-tmpx(ii));
    [~,tmp2]=min(tmp1);
    if ~isempty(tmp2)
        tmpd(ii)=d_opt(tmp2(1),ii);
        
    end
    tmpf(ii)=t_vubm(tmp2(1),ii);
    tmpe(ii)=eta_opt(tmp2(1),ii);
    p_opt(1,ii)=f_opt(tmp2(1),ii);
    p_opt(2,ii)=tmpx(ii);
    p_opt(3,ii)=tmpd(ii);
    p_opt(4,ii)=tmpf(ii);
    p_opt(5,ii)=tmpe(ii);
         
end

           

end

