%%% track_01d
%%

clear
clear global
clc

%% CONFIGURE VIDEO SETTINGS

% Load video.
video.file = VideoReader('birds_short.mov');

% startFrame is the frame within the video to which the program will begin
% running from.
video.startFrame = 30;

% The number of frames to be analysed.
video.numFrame = 100;%(int16(video.file.Duration * video.file.FrameRate) - video.startFrame);

% Check that first frame exists in the video file.


% Check for last frame. If last frame is before end of loop, set end of
% loop to be the last frame.


% Initialise the two frame variables that shall be compared during the
% tracking.
% for frame = 1 : 1 : video.startFrame
%     
%     video.RGBframe1 = readFrame(video.file);
%     
%     
% end
% 
% video.RGBframe2 = readFrame(video.file);

% test area start

% for x = 1 : 3
%     
%     video.RGBframe2 = readFrame(video.file);
%     figure;
%     imshow(video.RGBframe2);
%     
% end

% test area end

%% CONFIGURE DETECTION SETTINGS

% Select red car.
hueValue = 0.9560;

% % Select blue car.
% HueValue = 0.6091;
% 
% % Select yellow car.
% HueValue = 0.1279;

% The threshold required to distingish movement from error caused by
% image shift.
detect.difThreshold = 0.1;

% max car length (pixels) expected during movement between two frames (in pixels).
detect.maxCarLen = 15;

% min car width (pixels) expected during movement between two frames (in pixels).
detect.minCarWid = 8;

% Minimum movement detection area.
detect.minMoveArea = 6;

% max distance between centroids of detected movement.
detect.maxMoveDist = 15;

% Select hue tolerance.
hueTol = 0.1;

% Calculate the lower and upper limits for Hue detection.
detect.hueLow = hueValue - hueTol;
detect.hueHigh = hueValue + hueTol;

% Hue values are measured from 0 - 1. Ensure that limits shall be within
% these.
if detect.hueLow < 0
    detect.hueLow = 0;
end

if detect.hueHigh > 1
    detect.hueHigh = 1;
end

% %% CONFIGURE REGISTRATION SETTINGS
% 
% % The value of cameraSpeed represents the speed of the background.
% cameraSpeed = 0.1;
% 
% % Calculate the fraction of the image that shall be ignored, vertically
% % and horizontally, for the normalised cross correlation. This fraction is
% % related to the amount of movement expected from one frame to the next.
% vertGap = round(video.file.Height / (1 / cameraSpeed) )
% horiGap = round(video.file.Width / (1 / cameraSpeed) )
% 
% % Determine the rectangle for the reduced size image for the normalised
% % cross correlation.
% register.coords = [ (horiGap), (video.file.Height - vertGap), ...
%     (video.file.Width - horiGap*2), (video.file.Height - (vertGap*2)) ];

%% CONFIGURE ASSOCIATION SETTINGS

% Set the maximum range between target detections expected between
% consecutive frames.
associate.maxRange = 15;

if (exist('video', 'var'))
    
    associate.delT = 1/(video.file.FrameRate);
   
% elseif % insert other delT options.
    
end

% Number of active states of '2', before track being set to inactive.
associate.deactivateNum = 4;

%% CONFIGURE KALMAN FILTER SETTINGS

% Set state vector to zeros. [x, y]
kalman.XPred = [ 0; 0; 0; 0 ];

% Initialise state transition matrix.
kalman.A = [ 1, 1, 0, 0;
             0, 1, 0, 0;
             0, 0, 1, 1;
             0, 0, 0, 1];

% Initialise transformation matrix.
kalman.B = [ 1, 0, 0, 0;
             0, 0, 1, 0];

% Initialise Kalman gain.
kalman.K = zeros(2);

% Estimate measurement noise.
XPosErrorStdDev = 1;
YPosErrorStdDev = 1;
XPosMeasNoise = XPosErrorStdDev^2;
YPosMeasNoise = YPosErrorStdDev^2;
kalman.Nm = [ XPosMeasNoise, 0;
              0,             YPosMeasNoise];

% Estimate Process Noise.
procNoiseStdDev = 1;
kalman.Np = [ 0.45, 0.02, 0,    0;
              0.02, 0.3,  0,    0;
              0,    0,    0.45, 0.02;
              0,    0,    0.02, 0.3 ]*procNoiseStdDev;

kalman.CPred = [ 1e06, 0,    0,    0;
                 0,    1e06, 0,    0;
                 0,    0,    1e06, 0;
                 0,    0,    0,    1e06];

%%

[ tracks ] = trackTgts( video, detect, associate, kalman );















