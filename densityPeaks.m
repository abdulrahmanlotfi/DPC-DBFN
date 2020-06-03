function [peak,nPeak,k,neighbs,rho,rho1,disFromNeighb,delta]=densityPeaks(n,k,tetha,dis)
    [disFromNeighb,neighbs]=neighborhood(n,k,dis);
    rho=calculateRho(disFromNeighb,k);%Calculate the density for the image dataset
    rho1=calculetedrho1(disFromNeighb,k);
    delta=calculateDelta(rho1,dis);
    peak=selectPeak(rho1,delta,tetha);
    nPeak=size(peak,1);
end