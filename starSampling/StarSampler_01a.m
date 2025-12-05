
% Init workspace.
clear all;

% Initialise targetStar.
% tgt is '1' when a tgt is believed to be present in the data. This will
% likely change to a confidence value during development.
targetStar.tgt = 0;
% Estimated tgt Centre of Mass, based on the estimated edge positions.
targetStar.CoM = [];
targetStar.data = [];

targetStar.boundaries = [];

% Initialise resgiterStar
% dataSets dictates the number of datasets that shall be used for
% registration. The number requires to be even and between 2 and 180
% inclusive. These shall be evenly spread out around a 360 degrees.
registerConfig.dataSets = 180;
% dataSize determines the number of data elements collected for each
% dataset.
registerConfig.dataSize = 201;
% radius = max distance of the furthest data collected from the centre
% point in terms of vertical/ horizontal pixels.
registerConfig.radius = 100;
% Smoothing effect.
registerConfig.smoothing = 10;
% Initialise the estimated magnitude of registration.
registerConfig.absReg = 10;

% Initialise the find tgt requirement. Find = 1, means find tgt. Find = 0,
% means do not find tgt. This should always be set to '1' initially, unless
% registration is the only task required of the program.
find = 1;

% Load video into obj.
fileIn = VideoReader('IR1a.mp4');

% Set start frame.
startFrame = 1;
endFrame = (fileIn.Duration * fileIn.FrameRate);

% Cycle through data to get to the frame before startFrame. This is so that
% the required data for registration and tgt detection can be collected
% from the startFrame. This is not collected on startFrame-1 in the event
% that startFrame = 1.
for initialFrame = 1 : 1 : startFrame-1
    % Read frame.
    frame1 = readFrame(fileIn);
end

% Cycle through the startFrame, collecting data for registration and tgt
% detection estimation in the main program loop below.
% Read frame.
frame1 = readFrame(fileIn);
% Convert to BW from RGB.
frame1 = rgb2gray(frame1);
% For the first frame,
frame2 = frame1;
% Gather registration info for comparison.
[ gradData2 ] = gatherRegisterData(frame2, registerConfig);

% For each frame, starting from startFrame + 1 as these frames have already
% been cycled through. The frame 'startFrame' will not achieve any
% registration or target acquisition due to the lack of information to
% compare against, so this information shall only ever be estimated from
% the frame after 'startFrame'.
for frameCount = startFrame+1 : 1 : endFrame
    
    % Read frame.
    frame1 = readFrame(fileIn);
    
    % Convert from RGB to grey.
    frame1 = rgb2gray(frame1);
    
    % Registration
    [ xMove, yMove, gradData2, registerConfig ] = starRegister(frame1, gradData2, registerConfig);
    
    % Find tgts if required.
    if find == 1
        [ targetStar, find ] = findTgts(targetStar, searchStar, frame1);
    end
    
    % TEST
    
    % Show frame.
    figure(1);
    imshow(frame1);
    
    % TEST END
    
    % Update star data.
    for tgt = 1 : 1 : size(targetStar,1)
        targetStar(tgt) = starData(targetStar(tgt), frame1);
    end
    
    % Update CoM, boundaries.
    for tgt = 1 : 1 : size(targetStar,1)
        targetStar(tgt) = starUpdate(targetStar(tgt), frame1);
    end
    
    frame2 = frame1;
    
end

