function [output1,output2] = retailing(branches,input,totalb,sc,ol)
[m,n]=size(branches);
for i=1:m
    r=randi(n);
    tmp=branches(i,:);
    A=sum(tmp);
    for j=1:r
        s=randi(2);
        if s==2
            s=-1;
        end
        k=randi(n);
        tmp(k)=tmp(k)+s*input(1,k);
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