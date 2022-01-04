%This function takes in a vector of true labels ytrue
%and a vector of guessed labels yguess and reports back
%the error rate of the guesses as a percentage 0% to 100%.
function err = error_rate(ytrue,yguess)
if (~(iscolumn(ytrue)))
    error("ytrue is not a column vector.")
elseif (~(iscolumn(yguess)))
    error("yguess is not a column vector.")
elseif (length(ytrue)~=length(yguess))
    error("ytrue and yguess are not the same length.")
elseif (sum(unique(abs(ytrue))~=1))
    warning("Some elements in ytrue are not +1 or -1.")
elseif (sum(unique(abs(yguess))~=1))
    warning("Some elements in yguess are not +1 or -1.")
end

n = length(ytrue);
err = 100/n*sum([yguess ~= ytrue]);
