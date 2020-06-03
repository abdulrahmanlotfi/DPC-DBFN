function peak=selectPeak(rho,delta,frac)
    score=(((rho)./max(rho)).^2).*((delta)./max(delta));
    [~,B]=sort(score,'descend');
    peak=B(1:frac);

