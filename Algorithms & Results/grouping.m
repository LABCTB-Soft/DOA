function [o1,o2,o3] = grouping(branches,nob,trader,sc,groups)
property=zeros(trader,1);
for i=1:length(groups)
    j=groups(i);
    property(j)=property(j)+sc(j);
end
new_b=[];
for i=1:trader
    br=[branches,sc,groups];
    b=[];
    bests=[];
    [c,d]=size(br);
    for j=1:c
        if br(j,d)==i
            b=[b;br(j,:)];
        end
    end
    [c,f]=max(b(:,d-1));
    bests=[bests;b(f,:)];
    b(f,:)=[];
    [c,f]=max(b(:,d-1));
    bests=[bests;b(f,:)];
    b(f,:)=[];
    bests(:,d)=i;
    new_b=[new_b;bests];
end
nob=nob-trader*2;
br=[branches,sc,groups];
s=sum(property);
for i=1:trader
    c=fix((property(i)/s)*nob);
    for j=1:c
        [m,n]=size(br);
        k=randi(m);
        br(k,n)=i;
        new_b=[new_b;br(k,:)];
        br(k,:)=[];
    end
end
m=length(sc);
[a,b]=size(new_b);
r=m-a;
for i=1:r
    [m,n]=size(br);
    k=randi(m);
    new_b=[new_b;br(k,:)];
    br(k,:)=[];
end
if r>0
   new_b(a+1:m,d)=trader; 
end
o1=new_b(:,1:d-2);
o2=new_b(:,d-1);
o3=new_b(:,d);
end