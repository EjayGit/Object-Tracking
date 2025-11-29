function [ tracks ] = trackTgts( video, detect, associate, kalman )

% Initialise tracks.
tracks.active = [];
tracks.timestamp = [];
tracks.X = [];
tracks.XPred = [];
tracks.CPred = [];

% Load first frame.
for frame = 1 : 1 : video.startFrame
    video.RGBframe1 = readFrame( video.file );
end

% Turn RGBframe 1 into valueFrame 1.
[ valueFrame1 ] = RGB2Val( video.RGBframe1 );

% Start for loop for length of required frames.
for timestamp = 1 : 1 : video.numFrame
    
    % Load second frame data.
    video.RGBframe2 = readFrame( video.file );
        
    % Turn RGBframe 2 into valueFrame 2.
    [ valueFrame2 ] = RGB2Val( video.RGBframe2 );

    % Register image.
    [ frameShift, tracks ] = registerFrames( valueFrame1, valueFrame2, video, tracks );
    
    % Find detections.
    [ frameTgts ] = detectTgts( valueFrame1, valueFrame2, detect, frameShift );
    
    % Associate detections.
    [ tracks, delete ] = associateTgts( tracks, frameTgts, associate, timestamp );
    
    if ~isempty(tracks)
        isTracks = size( tracks(1).timestamp, 2 ) > 0;
    else
        isTracks = 0;
    end
    if isTracks

        % State Estimation.
        [ tracks ] = stateEstimate( kalman, tracks );

        [ tracks ] = deleteTracks( tracks, delete );

% TEST AREA   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%   TURN THIS INTO A PLOT AREA AND USE 'HANDLES' AND 'SET' COMMANDS INSTEAD
%   OF LOOPING 'PLOT'.
        figure(1);
        subplot(2,1,1);
        imshow(video.RGBframe2);
        subplot(2,1,2);
        cla
        imshow(video.RGBframe2);
        hold on;
        for track = 1 : 1 : size(tracks,2)
            lenXPred = size(tracks(track).XPred,2);
            if lenXPred > 20
                plotXPred = tracks(track).XPred(:,(lenXPred-20):lenXPred);
            else
                plotXPred = tracks(track).XPred;
            end
            plot(plotXPred(1,:), plotXPred(3,:), '-r');
            plot(plotXPred(1,:), plotXPred(3,:), 'or');
        end
        pause(0.05);
        for track = 1 : 1 : size(tracks,2)
            lenX = size(tracks(track).X,2);
            if lenX > 20
                plotX = tracks(track).X(:,(lenX-20):lenX);
            else
                plotX = tracks(track).X;
            end
            plot(plotX(1,:), plotX(2,:), '-b');
            plot(plotX(1,:), plotX(2,:), 'xb');
        end
        pause(0.05);
%
% TEST AREA END   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    end
    
    % Transfer frame 2 information into frame 1 information.
    valueFrame1 = valueFrame2;
    
% End for loop.
end

end

