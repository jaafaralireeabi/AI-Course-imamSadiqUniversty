function [ w,b ] = hebbRule( w,b,x,y )
    for i = 1:size(x,1)
        for j = 1:size(x,2)
            w(j) = w(j) + x(i,j) * y(i);
        end
        b = b + y(i);
    end
end

