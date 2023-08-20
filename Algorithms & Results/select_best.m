function [output] = select_best(branches,sc,groups,trader)
[m,n]=size(branches);
bests=zeros(trader,n);
for i=1:trader
    br=[];
    scr=[];
    for j=1:m
        if groups(j)==i
           br=[br;branches(j,:)];
           scr=[scr;sc(j)];
        end
    end
    [a,b]=max(scr);
    bests(i,:)=br(b,:);
end
output=bests;
end

