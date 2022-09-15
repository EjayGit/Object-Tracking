function sample = gradSelect(data, absReg)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function provides a structure carrying positive and negative parts
% to the value of gradients and the locations of those gradients.
% eg.
% sample.pos    = [ 2  13 8   3   4 ]   = These are the sums of the gradients.
% sample.posloc = [ 14 56 102 181 365 ] = These are the locations of the start of the gradients, in terms of pixels.
% There is a 'neg' and 'negloc' equivalent.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data((data>-0.001)&(data<0.001))=0;

sample.pos = [];
sample.posloc = [];
sample.neg = [];
sample.negloc = [];
tempPos = 0;
tempNeg = 0;

% Iniitialise the value of 'flip' and mark the location of the pos of neg
% pixel.
if data(absReg)>0
    flip = 1;
    sample.posloc = absReg;
    tempPos = tempPos + data(absReg);
elseif data(absReg)<0
    flip = -1;
    sample.negloc = absReg;
    tempNeg = tempNeg + data(absReg);
elseif data(absReg)==0
    % This line of code is not ideal as is assumes that if the first data
    % read has a gradient of 0, it is positive, and this could cause errors
    % when comparing later, ie. a positive feature could be found to have a
    % gradient sum of 0. This assumption should be reviewed.
    flip = 1;
    sample.posloc = absReg;
    tempPos = tempPos + data(absReg);
end

% Start from a value that corresponds to estimated movement, and end at the
% max value - estimated movement.
for pixel = absReg+1 : 1 : (size(data,1) - absReg)
    
    if data(pixel)>0
        if flip == -1
            sample.neg = cat(1,sample.neg, tempNeg);
            flip = 1;
            sample.posloc = cat(1, sample.posloc, pixel);
            tempPos = 0;
        end
        tempPos = tempPos + data(pixel);
    elseif data(pixel)<0
        if flip == 1
            sample.pos = cat(1,sample.pos, tempPos);
            flip = -1;
            sample.negloc = cat(1, sample.negloc, pixel);
            tempNeg = 0;
        end
        tempNeg = tempNeg + data(pixel);
    elseif data(pixel) == 0
        if flip == 1
            tempPos = tempPos + data(pixel);
        elseif flip == -1
            tempNeg = tempNeg + data(pixel);
        end
    end
    
end

% Store the remaining data being summed appropriately depending on the
% value of 'flip'.
if flip == 1
    sample.pos = cat(1,sample.pos, tempPos);
elseif flip == -1
    sample.neg = cat(1,sample.neg, tempNeg);
end

end

