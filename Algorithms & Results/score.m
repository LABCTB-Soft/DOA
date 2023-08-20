function [output] = score(branches,input,totalb,ol)
[m,n]=size(branches);
sc=zeros(m,1);
for i=1:m
   s=0;
   tmp=branches(i,:);
   THR=0;
   for j=1:n
       A=tmp(j);
       T=input(2,j);
       %A=A*T;
       tmp(j)=min(ol*input(1,j),A);
       s=s+tmp(j)*T;
       THR=THR+(tmp(j)/(ol*input(1,j)))*ol;
   end
   THR=THR/(ol*6);
   SR=0;
   SR=SR+tmp(1)/(ol*input(1,1));
   SR=SR+tmp(2)/(ol*input(1,2));
   SR=SR/2;
   Efficiency=s/totalb;
   alfa=1;
   beta=1;
   gama=1;
   Efficiency=min(1,Efficiency);
   SR=min(1,SR);
   THR=min(1,THR);
   sc(i)=Efficiency*alfa+SR*beta+THR*gama;
end
output=sc;
end