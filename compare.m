function [ compareResults ] = compare(comparisonData1, comparisonData2)

confidence = [];
translation = [];

% Find and order the most significant locations with relation to the
% size of the gradients in the 2nd data set, and 1st data set. First column
% is for grad value, 2nd for pixel (position).
sorted1 = sortData(comparisonData1);
sorted2 = sortData(comparisonData2);

% Determine the number of peaks in the 1st data set that shall be tested
% against the 2nd data set, using the 2nd data set to identify this number.
testNum = round(size(sorted2,1)/2);

% For each peak to be tested, find the difference between the gradients,
% and note the 'confidence' of each test, and select the best fit using the
% confidence values.
testResult = testGrads(sorted1,sorted2,testNum);

% Select the best fit using the confidence values.


% Estimate the translation using the estiated best fit.



compareResults = [confidence, translation];

end

