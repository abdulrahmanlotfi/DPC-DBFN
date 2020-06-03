function rho1=calculetedrho1(dN,k)
        rho=sum(dN,2);
        rho=rho/k;
        rho=1-rho;
     rho1=rho;
end