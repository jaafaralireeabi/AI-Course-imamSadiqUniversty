% bipolar training data for AND
clc;
clear all;
X = [ 1;-1];
t = [-1;1];

w = [0];   % weights
b = 0;       % bias

% ---- training (one pass) ----
[w b] = hebbRule(w,b,X,t);

%--
disp('final Weights:'); disp(w);
disp('final Bias:');    disp(b);
% ---- testing ----
[y] = netTest(X,w,b)