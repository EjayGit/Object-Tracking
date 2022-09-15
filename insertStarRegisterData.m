function [ resultData ] = insertStarRegisterData(frame, config)

CoMx = 150;%star(1).CoM(1);
CoMy = 450;%star(1).CoM(2);

resultData = zeros(config.dataSize, config.dataSets);

% Check num of data sets
if (mod(config.dataSets,2) ~= 0) || (config.dataSets<2) || (config.dataSets>180)
    error('dataSets must be an even number, between 2 and 180');
end

% interval = angle between consecutive dataSets.
interval = 180/config.dataSets;
angle = 0;

% TEST

% figure;
% imshow(frame);
% hold on;

% TEST END

for dataSet = 1 : 1 : config.dataSets
    xVal = sin(deg2rad(angle))*config.radius;
    yVal = cos(deg2rad(angle))*config.radius;
    resultData(:,dataSet) = improfile(frame,[CoMx+xVal,CoMx-xVal],[CoMy-yVal,CoMy+yVal],config.dataSize);
    
    % TEST DRAW SAMPLES
    
%     line([CoMx+xVal,CoMx-xVal],[CoMy-yVal,CoMy+yVal]);
    
    % TEST DRAW SAMPLES END
    
    angle = angle + interval;
    
end


end

