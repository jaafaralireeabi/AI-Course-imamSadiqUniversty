function [ y ] = netTest(x,w,b)
    for i=1:size(x,1)
        net =dot(x(i,:),w)+b;
        y(i)=hebbActivation(net);
    end
end

