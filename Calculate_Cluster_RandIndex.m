function RI =Calculate_Cluster_RandIndex(c1,c2)
%Calculates Rand Index of two partitions
%where c1,c2 are vectors listing the class membership
%
% See L. Hubert and P. Arabie (1985) "Comparing Partitions" Journal of 
% Classification 2:193-218

% Based on the version written by David Corney (D.Corney@cs.ucl.ac.uk)

% if nargin < 2 | min(size(c1)) > 1 | min(size(c2)) > 1
%    error('RandIndex: Requires two vector arguments')
%    return
% end

C=Contingency(c1,c2);	%form contingency matrix

n=sum(sum(C));
nis=sum(sum(C,2).^2);		%sum of squares of sums of rows
njs=sum(sum(C,1).^2);		%sum of squares of sums of columns

t1=nchoosek(n,2);		%total number of pairs of entities
t2=sum(sum(C.^2));	%sum over rows & columnns of nij^2
t3=.5*(nis+njs);

A=t1+t2-t3;		%no. agreements
RI=A/t1;			%Rand 1971		%Probability of agreement

end

function Cont=Contingency(Mem1,Mem2)
%CONTINGENCY Form contigency matrix for two vectors
% C=Contingency(Mem1,Mem2) returns contingency matrix for two
% column vectors Mem1, Mem2. These define which cluster each entity 
% has been assigned to.

if nargin < 2 | min(size(Mem1)) > 1 | min(size(Mem2)) > 1
   error('Contingency: Requires two vector arguments')
   return
end

Cont=zeros(max(Mem1),max(Mem2));

for i = 1:length(Mem1);
   Cont(Mem1(i),Mem2(i))=Cont(Mem1(i),Mem2(i))+1;
end

end


