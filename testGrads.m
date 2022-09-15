function [ testResult ] = testGrads(sorted1,sorted2,testNum)

% For each gradient in the 2nd data set, in order of significance, test the
% gradients in their relative positions against the gradients of the 1st
% data set, measuring the distance between those nearest gradients.
% For each test.
primaryGrad = zeros(1,3);
% Take the 'primary test' gradient.
primaryGrad(1,1:2) = sorted2(1,:);

for primaryCompare


for secondaryGrad = 1 : 1 : size(sorted2,1)



for test = 1 : 1 : testNum
    
    % Identify whether it is positive or negative.
    if primaryGrad(1,1) > 0
        primaryGrad(1,3) = 1;
    elseif primaryGrad(1,1) < 0
        primaryGrad(1,3) = -1;
    else
        error('The largest gradient is 0 and therefore registration cannot be estimated for this sample');
    end
    
    % If it is positive, look for the largest positive gradient from data
    % set 1.
    
    
end

end

