v = VideoReader('VID_20181120_152952.mp4');

nodos='ABCD'
i=1;
frame=1;
Hists=zeros(2773,256);

HistsE=ones(2816,1);
HistsE=char(HistsE);
%HistsE(1:563)='A';
HistsE(1:564+563)='A';
HistsE(564+564:564+564+563)='B';
HistsE(564+564+564:564+564+564+563)='C';
HistsE(564+564+564+564:564+564+564+564+563)='D';
HistsE(1);
HistsE(600);
HistsE(1200);
HistsE(1800);
HistsE(2300);
HistsE=HistsE(1:2816);

while hasFrame(v)
    f = readFrame(v);
    f=rgb2gray(f);
    h=int32(imhist(f));
    Hists(frame,:)=h;
    frame=frame+1
    if(mod(frame,553)==0)
       i=i+1; 
    end
end
save('HistB_Mat','Hists')
save('HistBE_Mat','HistsE')