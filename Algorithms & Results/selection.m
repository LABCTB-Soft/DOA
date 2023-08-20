function [output1] = selection(population,scga)
[r,c]=size(population);
newp=population;
s=sum(scga);
for i=1:r
    k=unifrnd(0,s,1,1);
    e=0;
    j=1;
    while e<k
        e=e+scga(j);
        j=j+1;
    end
    j=j-1;
    newp(i,1:c)=population(j,1:c);
end
output1=newp;
end