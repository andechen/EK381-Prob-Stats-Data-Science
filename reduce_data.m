% For PCA-reduced data with dimension k = 50, linear discriminant analysis training error rate is 7.5%.
% For PCA-reduced data with dimension k = 50, linear discriminant test error rate is 8.5%.
% For PCA-reduced data with dimension k = 50, perceptron training error rate is 7.6%.
% For PCA-reduced data with dimension k = 50, perceptron test error rate is 8.5%.
% For PCA-reduced data with dimension k = 100, linear discriminant analysis training error rate is 6.6%.
% For PCA-reduced data with dimension k = 100, linear discriminant test error rate is 7.2%.
% For PCA-reduced data with dimension k = 100, perceptron training error rate is 6.6%.
% For PCA-reduced data with dimension k = 100, perceptron test error rate is 7.2%.
% For PCA-reduced data with dimension k = 200, linear discriminant analysis training error rate is 4.8%.
% For PCA-reduced data with dimension k = 200, linear discriminant test error rate is 8.5%.
% For PCA-reduced data with dimension k = 200, perceptron training error rate is 4.7%.
% For PCA-reduced data with dimension k = 200, perceptron test error rate is 8.5%.
% For PCA-reduced data with dimension k = 400, linear discriminant analysis training error rate is 3.1%.
% For PCA-reduced data with dimension k = 400, linear discriminant test error rate is 9.2%.
% For PCA-reduced data with dimension k = 400, perceptron training error rate is 3.1%.
% For PCA-reduced data with dimension k = 400, perceptron test error rate is 9.2%.

% This function takes in a training data matrix Xtrain and uses
% it to compute the PCA basis and a sample mean vector. 
% It also takes in a test data matrix Xtest and a dimension k. 
% It first centers the data matrices Xtrain and Xtest by subtracting the
% Xtrain sample mean vector from each of their rows. It then uses the 
% top-k vectors in the PCA basis to project the centered Xtrain and Xtest
% data matrices into a k-dimensional space, and outputs
% the resulting data matrices as Xtrain_reduced and Xtest_reduced.
function [Xtrain_reduced Xtest_reduced] = reduce_data(Xtrain,Xtest,k)
    mu_train = mean(Xtrain);
    one = ones(size(mu_train,2),1);
    covX = cov(Xtrain);
    V = pca(covX);

    Vk = V(:,1:k);

    Xrun = Xtrain;
    [row col] = size(Xrun);
    X_centered = zeros(row, col);
    for i = 1:row
    X_centered(i,:) = Xrun(i,:) - mu_train;
    end
    X_reduced = X_centered * Vk;
    Xtrain_reduced = X_reduced;

    Xrun = Xtest;
    [row col] = size(Xrun);
    X_centered = zeros(row, col);
    for i = 1:row
    X_centered(i,:) = Xrun(i,:) - mu_train;
    end
    X_reduced = X_centered * Vk;
    Xtest_reduced = X_reduced;

%Your code should go above this line.
if (size(Xtrain_reduced,1)~=size(Xtrain,1)) 
    error("The number of rows in Xtrain_reduced is not the same as the number of rows in Xtrain.")
elseif (size(Xtest_reduced,1)~=size(Xtest,1)) 
    error("The number of rows in Xtest_reduced is not the same as the number of rows in Xtest.")
elseif (size(Xtrain_reduced,2)~=k) 
    error("The number of columns in Xtrain_reduced is not equal to k.")
elseif (size(Xtest_reduced,2)~=k) 
    error("The number of columns in Xtest_reduced is not equal to k.")
end
