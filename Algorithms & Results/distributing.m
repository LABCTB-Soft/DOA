function [output1,output2] = distributing(branches,input,totalb,sc,trader,groups,ol)
[m,n]=size(branches);
bests=select_best(branches,sc,groups,trader);
for i=1:m
    tmp=branches(i,:);
    best=bests(groups(i),:);
    f=randi(n);
    for r=1:f
        k=randi(n);
        tmp(k)=best(k);
    end
    tmp=band_investigation(tmp,totalb,input,ol);
    scr=score(tmp,input,totalb,ol);
    if scr>sc(i)
       sc(i)=scr;
       branches(i,:)=tmp;
    end
end
output1=branches;
output2=sc;
end