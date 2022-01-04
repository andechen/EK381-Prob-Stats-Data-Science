%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat avgdog] = average_pet(X,y)

[row, col] = size(X);
dogs = [];
cats = [];

for i = 1:row
    if(y(i) == 1)
        dogs = [dogs ; X(i,:)];
    else
        cats = [cats ; X(i,:)];
    end
end

avgcat = mean(cats);
avgdog = mean(dogs);

%Your code should go above this line.
if (size(avgcat,1)~=1) 
    error("The variable avgcat is not a row vector.")
end
if (size(avgcat,2)~=size(X,2))
    error("The variable avgcat does not have the same number of columns as the data matrix input.")
end
if (size(avgdog,1)~=1) 
    error("The variable avgdog is not a row vector.")
end
if (size(avgdog,2)~=size(X,2)) 
    error("The variable avgdog does not have the same number of columns as the data matrix input.")
end

end