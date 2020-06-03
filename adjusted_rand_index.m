function ARI =adjusted_rand_index(T,Label,n)
TP=0;
TN=0;
FP=0;
FN=0;
for xi=1:n-1
    for xj=xi+1:n
        TP=TP+((Label(xi)==Label(xj))&&(T(xi)==T(xj)));
        TN=TN+((Label(xi)~=Label(xj))&&(T(xi)~=T(xj)));
        FP=FP+((Label(xi)~=Label(xj))&&(T(xi)==T(xj)));
        FN=FN+((Label(xi)==Label(xj))&&(T(xi)~=T(xj)));
    end
end
A=2*((TP*TN)-(FP*FN));
B=((TP+FP)*(FP+TN))+((TP+FN)*(FN+TN));
adjusted_rand_index=A/B;
ARI=adjusted_rand_index;
end