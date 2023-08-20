function [output] = selectbest(trees,nob)
[m,n]=size(trees);
bests=zeros(nob,n);
for i=1:nob
    [a,b]=max(trees(:,n));
    bests(i,:)=trees(b,:);
    trees(b,:)=[];
end
output=bests;
end