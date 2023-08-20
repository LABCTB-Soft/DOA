function [output] = firstgrouping(branches,trader)
[m,n]=size(branches);
groups=zeros(m,1);
g=1;
for i=1:fix(m/trader):m
    groups(i:min(i+trader-1,m))=g;
    g=g+1;
end
output=groups;
end

