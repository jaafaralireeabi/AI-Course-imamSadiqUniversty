function [ y,net ] = netTest(x,w,b)
        net = dot(x, w) + b;
        y = hebbActivation(net);
end

