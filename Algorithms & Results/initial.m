function [output] = initial(n,totalb,nob,input,ol)
 branches=zeros(nob,n);
 ol=1;
 for i=1:nob
     k=totalb;
     for j=1:n
         r=randi(ol);
         m=r*input(1,j);
         if m>k
             m=0;
         end
         branches(i,j)=m;
         k=k-m;
         if k<=0
             break;
         end
     end
 end
 output=branches;
end

