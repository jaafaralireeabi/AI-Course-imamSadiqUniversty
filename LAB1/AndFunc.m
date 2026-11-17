X = [0 0;
     1 0;
     0 1;
     1 1];
 
W = [1 1];

T = 2;
 
for i = 1:size(X,1)
    Wsum = dot(X(i,:),W)
    y = activation(Wsum,T)
end
