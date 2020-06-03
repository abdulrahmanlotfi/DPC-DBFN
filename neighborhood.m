function [disFromNeighb,neighbs]=neighborhood(n,k,dis)
    neighbs=zeros(n,k);
    disFromNeighb=zeros(n,k);
    [D,N]=sort(dis);
    for i=1:n
        for j=1:k
            neighbs(i,j)=N(j+1,i);
            disFromNeighb(i,j)=D(j+1,i);
        end;
    end;
end