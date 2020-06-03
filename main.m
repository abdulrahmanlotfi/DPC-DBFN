clear; clc
load dataset0\fish
[X0,T,n,d]=readData(fish);
C=size(unique(T),1);
C=C-1; %Decrease one class for the Noise dataset
X0=normalize(X0);
tic
dis=pdist2(X0,X0);
%% ____________________________________________Parameter
k=18;
%% %__________________________________________Density Peak
[peak,npeak,k1,neigh,rho,rho1,disFromNeighb,delta]=densityPeaks(n,k,C,dis);
[Label_core,roo,noise]=calculatecore(neigh,rho1,k,n,npeak,peak,delta);
Label=assignnonlabel(Label_core,npeak,dis,k1,peak);
tim=toc;
[indxn ~]=find(noise==2);
Label(indxn)=C+1;
%% ___________________________________________Measures
BestMea=BestMeasure(T,Label,n) %measures purity, NMI, RI,ARI 
%% %_________________________________________Drawing
draw3(X0,roo,Label_core,peak,npeak,T,noise,Label);