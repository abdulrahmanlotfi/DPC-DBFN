function BestMea=BestMeasure(T,DLP_Label1,n)
purity=Purity(T,DLP_Label1,2);
NMII = nmi(T,DLP_Label1);
RI =Calculate_Cluster_RandIndex(T,DLP_Label1);
ARI =adjusted_rand_index(T,DLP_Label1,n);
BestMea=[purity,NMII,RI,ARI];
end