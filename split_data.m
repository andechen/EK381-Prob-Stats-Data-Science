%This function takes in a data matrix X, label vector y, and 
%the desired percentage testpercent. It randomly assigns  
%testpercent of the rows of X and y to Xtest and ytest. 
%The remaining data is assigned to Xtrain and ytrain.
function [Xtrain, ytrain, Xtest, ytest] = split_data(X,y,testpercent)

[n p] = size(X);
ntest = round(n*testpercent/100);
order = randperm(n);

Xtest = X(order(1:ntest),:);
Xtrain = X(order(ntest+1:n),:);
ytest = y(order(1:ntest));
ytrain = y(order(ntest+1:n));

