function [out1] = mutation(population,input,mrate,totalb,ol)
[m,n]=size(population);
for i=1:round(m*mrate)
   k=randi(m);
   c=randi(n);
   fl=randi(2);
   if fl==2
       fl=-1;
   end
   population(k,c)=max(0,population(k,c)+fl*input(1,c));
   population(k,:)=band_investigation(population(k,:),totalb,input,ol);
end
out1 = population;
end

