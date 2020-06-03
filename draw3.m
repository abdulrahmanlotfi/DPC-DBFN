function draw3(X0,roo,Label_core,peak,npeak,T,noise,Label)
figure('Position', [100 100 600 350]);
map=[
141 160 203;
229 196 148;
102 194 165;
231 138 195;
166 216 84;
251 141 98;
254 216 47;]/255;
colormap(map);
X2=X0(noise==0,:);
Y2=Label(noise==0,:);
scatter(X2(:,1),X2(:,2),15,Y2,'filled')
hold on
X3=X0(noise==1,:);
Y3=Label(noise==1,:);
scatter(X3(:,1),X3(:,2),15,Y3,'filled')
hold on
scatter(X0(noise==2,1),X0(noise==2,2),15,...
    'markerFaceColor',[0.85 0.85 0.85],'MarkerEdgeColor',[0.6 0.6 0.6],'marker','o');
hold on
X4=X0(peak,:);
Y4=Label(peak,:);
for i=1:npeak
    scatter(X4(:,1),X4(:,2),40,Y4, 'markerFaceColor',[0.2 0.2 0.2],'marker','^')
end
box on
xlim([-0.05 1.05])
ylim([-0.05 1.05])
set(gca,'YTickLabel',[],'XTickLabel',[]);