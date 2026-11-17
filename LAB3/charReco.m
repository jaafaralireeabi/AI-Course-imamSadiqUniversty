function [y] = charReco(imgTest)
    fileName='xoData.txt';
    file=load(fileName);
    startRow=1;
    endRow=size(file,1);
    xoData=importfile1(fileName,startRow,endRow);
    x=xoData(:,1:25);
    t=xoData(:,26);
    
    %intilaztion w=0; b=0
     for i=1:size(x,2)
        w(i) = 0;
     end
        b = 0;

        %train
        [w b] = hebbRule(w,b,x,t)
        %test
        y = netTest(imgTest,w,b);
end