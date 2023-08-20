%clear
tic
totalb=30000;
input=[32,64,128,256,384,512;0.5,3,2,4,6,9];
%input(1,:)=input(1,:)*ol;
[m,n]=size(input);
WCCP=[];
for i=1:50
    mtime=2;
    nteam=10;
    teams=initial(n,totalb,nteam,input,ol);
    nog=2;
    scwcc=score(teams,input,totalb,ol);
    hamwcc=[];
    nos=30;
    nog=fix(nteam*.25);
    for g=1:nos
       groupswcc=firstgrouping(teams,nog); 
       [teams,scwcc]=groupmatch(teams,scwcc,groupswcc,mtime,input,totalb,ol);
       hamwcc=[hamwcc,max(scwcc)];
    end
    WCCP=[WCCP,max(hamwcc)];
end
toc
% teams=eliminate(teams,mtime,input);
% plot(1:nos,hamwcc)