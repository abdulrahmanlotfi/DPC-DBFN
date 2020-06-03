function [Label_core,roo,noise]=calculatecore(neigh,rho,k,n,npeak,peak,delta)
roo=rho>mean(rho);
noise1=rho<mean(rho);
noise2=delta>45*var(delta);
noise=noise1+noise2;
indxroo=find(roo);
Label=zeros(n,1);
for j=1:npeak
    Label(peak(j))=j;
    Label(neigh(peak(j),:))=j;
    q=neigh(peak(j),:);
    while (~isempty(q))
        temp=q(1);
        qkn=neigh(temp,:);
        for ii=1:k
            if(Label(qkn(ii))==0 && ismember(qkn(ii),indxroo) )
               Label(qkn(ii))=Label(temp);
               q=cat(2,q,qkn(ii));
            end
        end
        q=q(2:end);
    end
end
Label_core=Label;
end