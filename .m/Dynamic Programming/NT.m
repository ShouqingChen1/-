[psort,index]=sort(P,'ascend');
T=QT(:,2);
tsort=T(index);
prob=tsort/sum(tsort);%ÿһ��������Ӧ�ĸ���
s_prob(1)=1-prob(1);%�ۻ�����P(Q>Q0)
U=length(prob);
for i=2:U
    s_prob(i)=s_prob(i-1)-prob(i);
end
figure(1);
plot(s_prob*100,psort)
axis([0 100 0 max(psort)]);
set(gca,'FontName','Times New Roman','FontSize',12)%����������̶��������ƣ���С
xlabel('��֤��(%��','fontsize',12,'FontName','STFangSong');
ylabel('��վ����(��λ��kw)','fontsize',12,'FontName','STFangSong');
set(gcf,'color','w');
grid on 