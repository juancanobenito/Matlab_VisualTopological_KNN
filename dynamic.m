load('HistB_Mat')
load('HistBE_Mat')
Md1 = fitcknn(Hists,HistsE);
Md1.NumNeighbors=4;
v = VideoReader('VID_20181120_152828.mp4');
frame=1;
errorA=0;
errorB=0;
errorC=0;
errorD=0;

while hasFrame(v)
    f = readFrame(v);
    f=rgb2gray(f);
    h=imhist(f)';
    position =  [1 50];
    predictor = predict(Md1,h)
    RGB = insertText(f,position,predictor,'FontSize',30);
    imshow(RGB);
    %if frame<=591
        %FrameA
        %if predictor ~= 'A'
            %errorA=errorA+1;
        %end
    %elseif frame>591 && frame <=1182
    if frame <=1182
        %FrameB
        if predictor ~= 'A'
            errorA=errorA+1;
        end
    elseif frame>1182 && frame <=1773
        %FrameC
        if predictor ~= 'B'
            errorB=errorB+1;
        end
    elseif frame>1773 && frame <=2364    
        %FrameD
        if predictor ~= 'C'
            errorC=errorC+1;
        end
    elseif frame>2364 && frame <=2958
        %FrameE
        if predictor ~= 'D'
            errorD=errorD+1;
        end
    end
    frame=frame+1
end

errorAT=(abs(591-errorA)/591)*100
errorBT=(abs(591-errorB)/591)*100
errorCT=(abs(591-errorC)/591)*100
errorDT=(abs(591-errorD)/591)*100
%errorET=(abs(593-errorE)/593)*100
%errorTotal=(errorA+errorB+errorC+errorD+errorE)
errorTotal=(errorA+errorB+errorC+errorD)
mediaTotal = 100-(errorTotal/2958*100)