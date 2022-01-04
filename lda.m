%Linear discriminant analysis training error rate is 0.75%.
%Linear discriminant analysis test error rate is 24%.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)

[row, col] = size(Xrun);
yguess = zeros(row, 1);

[avgcat avgdog] = average_pet(Xtrain,ytrain);

% Seperate Xtrain into cat matrix and dog matrix
dogs = Xtrain(find(ytrain == 1),:);         % dogs
cats = Xtrain(find(ytrain == -1),:);        % cats
% Find n_train,cat and n_train,dog
n_dogs = size(dogs,1);
n_cats = size(cats,1);
% find covcat and covdog
covdog = cov(dogs);
covcat = cov(cats);
% find covmatrix
covmatrix = (1/(size(ytrain,1)-2)) * ((n_cats-1)*covcat + (n_dogs-1)*covdog);

covmatrix = pinv(covmatrix);

for i = 1:row
    if (2 * Xrun(i,:) * covmatrix * (avgdog-avgcat)' >= avgdog * covmatrix * avgdog' - avgcat * covmatrix * avgcat')
        yguess(i) = 1;
    else
        yguess(i) = -1;
    end
end

%Your code should go above this line.
if (~iscolumn(yguess))
    error("yguess is not a column vector.")
elseif (length(yguess)~=size(Xrun,1))
    error("Length of yguess is not equal to the number of rows in Xrun.")
elseif (sum(unique(abs(ytrain))~=1))
    warning("Some elements in ytrain are not +1 or -1.")
elseif (sum(unique(abs(yguess))~=1))
    warning("Some elements in yguess are not +1 or -1.")
end