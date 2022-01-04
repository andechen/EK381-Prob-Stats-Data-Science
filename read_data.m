%This function reads in all n images in catsfolder/ and dogsfolder/. 
%Each 64 x 64 image is reshaped into a length-4096 row vector. 
%These row vectors are stacked on top of one another to get a data matrix
%X of size n x 4096. We also generate a -1 label if the row vector corresponds
%to a cat image and a +1 label if the row vector corresponds to a dog image
%and stack these on top of one another to get a label vector y of length n.

function [X y] = read_data
    catsfolder = 'catsfolder/'; 
    catfiles = dir(fullfile(catsfolder, '*.jpg')); 
    catfilenames = {catfiles.name};
    numcats = length(catfilenames);
    
    cats = [];
    for i = 1:numcats
        catfilenametemp = catfilenames{i};
        catimagetemp = imread(strcat(catsfolder,catfilenametemp));
        catvectemp = reshape(catimagetemp,1,4096);
        cats = [cats ; catvectemp];
    end
       
    catlabels = -1*ones(numcats,1);
    
    dogsfolder = 'dogsfolder/'; 
    dogfiles = dir(fullfile(dogsfolder, '*.jpg')); 
    dogfilenames = {dogfiles.name};
    numdogs = length(dogfilenames);
    
    dogs = [];
    for i = 1:numdogs
        dogfilenametemp = dogfilenames{i};
        dogimagetemp = imread(strcat(dogsfolder,dogfilenametemp));
        dogvectemp = reshape(dogimagetemp,1,4096);
        dogs = [dogs ; dogvectemp];
    end
    
    doglabels = ones(numdogs,1);
    
    X = [double(cats); double(dogs)];
    y = [catlabels; doglabels];
end
