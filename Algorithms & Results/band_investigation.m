function [output] = band_investigation(branch,totalb,input,ol)
branch=abs(branch);
n=length(branch);
for i=1:n
    branch(i)=min(input(1,i)*ol,branch(i)); 
end
s=sum(branch.*input(2,:));
while s>totalb
   j=randi(n);
   v=branch(j)-input(1,j);
   if v>0
        branch(j)=v;
        s=s-input(1,j)*input(2,j);
   end
end
output=branch;
end

