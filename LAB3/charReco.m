function [y] = charReco(imgTest)
    fileName='xoData.txt';
    startRow=1;
    endRow=inf;
    xoData=importfile1(fileName,startRow,endRow);
    x=xoData(:,1:25);
    t=xoData(:,26);
    
    %intilaztion w=0; b=0
        w=zeros(1,size(x,2));
        b = 0;

        %train
        [w b] = hebbRule(w,b,x,t)
        %test
        y = netTest(imgTest,w,b);
end