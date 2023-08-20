function [ out1,out2 ] = groupmatch(teams,scwcc,groupswcc,mtime,input,totalb,ol)
  [m,n]=size(teams);
  for i=1:m
      for j=i+1:m
          if groupswcc(i)==groupswcc(j)
             [teams(i,:),scwcc(i)]=match(teams(i,:),teams(j,:),scwcc(i),mtime,input,totalb,ol);
          end
      end
  end
  out1=teams;
  out2=scwcc;
end