function [ y ] = hebbActivation( net )
    if net > 0
        y = 'X';
    else
        y = 'O';
    end
end
