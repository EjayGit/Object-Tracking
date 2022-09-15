function [ smoothedData ] = smoothData(data, smoothing)

samples = size(data,2);
smoothedData = zeros(size(data,1),samples);

for sample = 1 : 1 : samples
    %smoothedData(:, sample) = spline(1:199,data(:, sample), data(:, sample));
    smoothedData(:, sample) = smooth(data(:, sample),smoothing);
end

% TEST

% figure('Name','Smoothed Data');
% plot(1:201, smoothedData(:,89),'-b');
% figure('Name','Smoothed Data');
% plot(1:200, smoothedData(1:200,90),'-g');
% figure('Name','Smoothed Data');
% plot(1:201, smoothedData(:,91),'-r');
% figure('Name','Smoothed Data');
% plot(1:201, smoothedData(:,4),'-m');

% TEST END

end

