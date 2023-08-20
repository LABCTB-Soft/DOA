function [out1] = crossover(population,crate,totalb,ol,input)
[m,n]=size(population);
for i=1:round(m*crate)
   k1=randi(m);
   k2=randi(m);
   c1=randi(n);
   c2=randi(n);
   if c1>c2
       tmp=c1;
       c1=c2;
       c2=tmp;
   end
   population(k1,c1:c2)=population(k2,c1:c2);
   population(k1,:)=band_investigation(population(k1,:),totalb,input,ol);
end
out1 = population;
end
