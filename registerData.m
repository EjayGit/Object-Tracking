function [ xMove, yMove ] = registerData(data1, data2, absReg)

% compareResults = [ :, 2 ]; where the first column states the comparison
% confidence, the second column states the suggested translation, and the
% third column (future use) will state the suggested scale of the
% translation.

compareResults = zeros(size(data1,2),2);

for sample = 1 : 1 : size(data1,2)
    
    % Find and sum gradients, and mark locs.
    comparisonData1 = gradSelect2(data1(:,90), absReg);
    comparisonData2 = gradSelect2(data2(:,90), absReg);
    
    % Run comparison and store similarity.
    compareResults(sample,:) = compare(comparisonData1, comparisonData2);
    
end

% Analyse similarities.
[ xMove, yMove ] = regAnalysis(compareResults);

