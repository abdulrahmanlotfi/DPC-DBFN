function rho=calculateRho(dN,k)
rho=exp(-dN./k);
rho=sum(rho,2);
end