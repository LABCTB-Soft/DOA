tic
totalb=30000;
input=[32,64,128,256,384,512;0.5,3,2,4,6,9];
TRP=[];
for i=1:50
    %input(1,:)=input(1,:)*ol;
    [m,n]=size(input);
    nob=20;
    branches=initial(n,totalb,nob,input,ol);
    sc=score(branches,input,totalb,ol);
    noi=30;
    trader=fix(nob*.25);
    groups=firstgrouping(branches,trader);
    ham=[];
    for i=1:noi
    %     branches
        [branches,sc,groups]=grouping(branches,nob,trader,sc,groups);
        [branches,sc]=retailing(branches,input,totalb,sc,ol);
        [branches,sc]=distributing(branches,input,totalb,sc,trader,groups,ol);
        [branches,sc]=importing_exporting(branches,input,totalb,sc,trader,groups,ol);
        ham=[ham,max(sc)];
    end
    TRP=[TRP,max(ham)];
end
toc
%plot(1:length(ham),ham)