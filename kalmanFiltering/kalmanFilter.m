function [ XPred, CPred ] = kalmanFilter( kalman, meas )

% Estimate the measurements from the prediction.
measEst = kalman.B * kalman.XPred;

% Estimate the Kalman gain.
kalman.K = kalman.CPred * kalman.B' * inv( kalman.B * kalman.CPred * kalman.B' + kalman.Nm );

% Estimate the next measurements (states that are measured).
XEst = kalman.XPred + kalman.K * ( meas - measEst );

% Estimate the next covarience.
CEst = ( eye( size( kalman.CPred ) ) - kalman.K * kalman.B ) * kalman.CPred;

% Predict the next states. This may include more states than are actually
% measured.
XPred = kalman.A * XEst;

% Predict the next covarience matrix.
CPred = ( kalman.A * CEst * kalman.A' ) + kalman.Np;

end

