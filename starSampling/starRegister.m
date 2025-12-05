function [ xMove, yMove, gradData2, config ] = starRegister(frame, gradData2, config)

% Collect data for registration.
[ resultData ] = insertStarRegisterData(frame, config);

% Smooth collected data to reduce noise.
[ smoothedData ] = smoothData(resultData, config.smoothing);

% Find the gradient of the smoothed data.
[ gradData1 ] = findGrads(smoothedData);

% Find results of the data registration.
[ xMove, yMove ] = registerData(gradData1, gradData2, config.absReg);

% Update the magnitude of the estimated registration.
config.absReg = sqrt(xMove^2 + yMove^2);

gradData2 = gradData1;

end

% gradData to and from this funciton needs to be changed to carry the
% actual data that is used to register, ie. the gradient sums and locs.
% These can then be used for tgt detection.