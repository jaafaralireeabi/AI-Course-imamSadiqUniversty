function [ y ] = activation ( s,T )
    if s >= T
        y = 1
    else
        y = 0
    end
end

