function [ w,b ] = hebbRule( w,b,x,y )
    for i=1:size(x,1)
        w=w+x(i,:)*y(i);
        b=b+y(i);
    end 
end

