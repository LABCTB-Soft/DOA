function [ out1,out2 ] = match( first1,second1,sw,mtime,input,totalb,ol)
      first=first1;
      second=second1;
      n=length(first);
      %[m1,n1]=size(input);
      for t=1:mtime
          s=randi(2);
          if (s==1)
             k=randi(n-2);
             for e=1:k
                f=randi(n);
%                 s=randi(n-2);
                first(1,f)=second(1,f);
             end
             first=band_investigation(first,totalb,input,ol);
             ns=score(first,input,totalb,ol);
             if ns>=sw
                 sw=ns;
                 first1=first;
             end
          end
          if (s==2)
             k=randi(n);
             for e=1:k
                f=randi(n);
                fl=randi(2);
                if fl==2
                    fl=-1;
                end
                k=randi(n);
                first(k)=first(k)+fl*input(1,k);
             end
             first=band_investigation(first,totalb,input,ol);
             ns=score(first,input,totalb,ol);
             if ns>=sw
                 sw=ns;
                 first1=first;
             end
          end
%           if (s==3)
%              f=randi(n-2);
%              for j=1:f
%                  first(1,randi(n-2))=randi(2)-1; 
%              end
%              first=score(first,input);
%              if first(1,n)>=first1(1,n)
%                  first1=first;
%              end
%           end
%           if (s==4)
%              k=randi(n-2);
%              s=randi(n-2);
%              if s<k
%                  c=s;
%                  s=k;
%                  k=c;
%              end
%              aa=first(1,k);
%              for e=k:s-1
%                 first(1,e)=first(1,e+1);
%              end
%              first(1,s)=aa;
%              first=score(first,input);
%              if first(1,n)>=first1(1,n)
%                  first1=first;
%              end
%           end
      end
      out1=first1;
      out2=sw;
end

