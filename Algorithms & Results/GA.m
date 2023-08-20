%clear
tic
totalb=30000;
input=[32,64,128,256,384,512;0.5,3,2,4,6,9];
%input(1,:)=input(1,:)*ol;
GAP=[];
for i=1:50
    [m,n]=size(input);
    nop=10;
    population=initial(n,totalb,nop,input,ol);
    nog=30;
    scga=score(population,input,totalb,ol);
    hamga=[];
    nos=30;
    crate=30;
    mrate=30;
    for g=1:nog
       population=mutation(population,input,mrate,totalb,ol); 
       population=crossover(population,crate,totalb,ol,input); 
       population(round(.8*nop)+1:nop,:)=initial(n,totalb,nop-.8*nop,input);
       scga=score(population,input,totalb,ol);
       population=selection(population,scga); 
       hamga=[hamga,max(scga)];
    end
    GAP=[GAP,max(hamga)];
end
toc