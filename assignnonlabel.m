function Label=assignnonlabel(Label_core,npeak,dis,k1,peak)
nn=Label_core(Label_core==0);
nn=size(nn,1);
sumdist=zeros(nn,npeak);
sumdist1=zeros(nn,npeak);
for i=1:npeak
    disL1=dis(Label_core==0,peak(i));
    sumdist1(:,i)=disL1;
end
for ii=1:npeak
    disL=dis(Label_core==0,Label_core==ii);
    [disort,~]=sort(disL,2,'ascend');
    kk1=size(disL,2);
    if(kk1<k1)
    diknn=disort(:,1:kk1);
    else
    diknn=disort(:,1:k1);
    end
sumdist(:,ii)=sum(diknn,2);
end
belong=exp(-(sumdist));
[~,H]=max(belong,[],2);
indnonlabel=find(Label_core==0);
Label1=Label_core;
Label1(indnonlabel,1)=H;
Label=Label1;
end