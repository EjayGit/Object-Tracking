function [ gradData ] = gatherRegisterData(frame, config)

% Collect data for registration.
[ resultData ] = insertStarRegisterData(frame, config);

% Smooth collected data to reduce noise.
[ smoothedData ] = smoothData(resultData, config.smoothing);

% Find the gradient of the smoothed data.
[ gradData ] = findGrads(smoothedData);

end

