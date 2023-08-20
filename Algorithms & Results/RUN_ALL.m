clear
TP=[];
GP=[];
WP=[];
hTP=[];
hGP=[];
hWP=[];
for pol=1:8
   ol=pol
   Trader
   wcc
   GA
   TP=[TP;TRP];
   hTP=[hTP;ham];
   GP=[GP;GAP];
   hGP=[hGP;hamga];
   WP=[WP;WCCP];
   hWP=[hWP;hamwcc];
   ga=hGP(pol,:);
   wc=hWP(pol,:);
   x=1:30;
   tr=hTP(pol,:);
   ga=sort(ga);
   %subplot(4,2,pol),plot(x,tr,x,wc,x,ga)
end
save 'results.mat'

for pol=1:8
   ol=pol;
   ga=GP(pol,:);
   wc=WP(pol,:);
   x=1:30;
   tr=TP(pol,:);
   subplot(4,2,pol),plot(x,tr,x,wc,x,ga)
end