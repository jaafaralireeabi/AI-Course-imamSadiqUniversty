function [y] = charReco(imgTest)
    filename ='xoData.txt';
    datalines = [1,inf];
    xoData = importfile1(filename, datalines);
    x=xoData(:,1:25);
    t=xoData(:,26);

    w = zeros(1,size(x,1));
    b=0;
    %train
    [w b] = hebbRule(w,b,x,t);

    %test
    y=netTest(imgTest,w,b);
end