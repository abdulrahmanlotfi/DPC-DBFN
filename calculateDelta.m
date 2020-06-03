function delta=calculateDelta(rho,di)
    n=size(rho,1);
    idx=[];
    delta=zeros(n,1);
    for i=1:n
        for j=1:n
            if(rho(i)<rho(j) && i~=j)
                idx(end+1)=di(i,j);
            end;
        end;
        if(~isempty(idx))
            delta(i)=min(idx);
        else
            delta(i)=max(di(i,:));
        end;
        idx=[];
    end;