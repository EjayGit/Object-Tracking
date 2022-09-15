
% Init workspace.
clear all;

% Load video into obj.
fileIn = VideoReader('IR1k.mp4');

% Set start frame.
startFrame =15;
noFrames = 20;%(fileIn.Duration * fileIn.FrameRate)

star.CoM = [];
star.data = [];
star.boundaries = [];

% Set start frame.
count = 0;
for frameCount = 1 : 1 : startFrame-1
    frame = readFrame(fileIn);
    count = count + 1;
end

% frame1 = readFrame(fileIn);
% frame1 = rgb2gray(frame1);
% points1 = detectMinEigenFeatures(frame1,'FilterSize', 3);
% [features1,valid_points1] = extractFeatures(frame1,points1);

% Read and show frames from start frame to last frame.
for frameCount = 1 : 1 : noFrames
    
    frame2 = readFrame(fileIn);
    frame2 = rgb2gray(frame2);
    %     points2 = detectMinEigenFeatures(frame2,'FilterSize', 3);
    
    %     [features2,valid_points2] = extractFeatures(frame2,points2);
    %     indexPairs = matchFeatures(features1,features2);
    %     matchedPoints1 = valid_points1(indexPairs(:,1),:);
    %     matchedPoints2 = valid_points2(indexPairs(:,2),:);
    %     if (size(matchedPoints1,1)>1 && size(matchedPoints2,1)>1)
    %         [tform, inlierDistorted, inlierOriginal] = estimateGeometricTransform(matchedPoints1,matchedPoints2, 'similarity');
    %         figure(1);
    %         showMatchedFeatures(frame1,frame2,matchedPoints1,matchedPoints2);
    %     end
    %     Tinv = tform.invert.T;
    
    %     BW = edge(frame2,'Canny', ([0.005 0.1]));
    %     figure(1);
    %     imshow(BW);
    
    %     if frameCount == 1
    %         figure(2)
    %         h2 = scatter(points2.Location(:,1),points2.Location(:,2), 'bx');
    %         axis([0 720 0 576]);
    %         set(gca,'YDir','Reverse');
    %     end
    %     set(h2,'xdata', points2.Location(:,1), 'ydata',points2.Location(:,2));
    %     drawnow;
    
    star(1).CoM = [150 450];
    star(1) = insertStarData8(star, frame2);
%     figure(1);
%     imshow(frame2);
%     
    %     star = starSample(star, frame2);
    
    figure;
    %plot(1:100,star(1).data(:,1),'-b',1:100,star(1).data(:,2),'-r',1:100,star(1).data(:,3),'-y',1:100,star(1).data(:,4),'-m');
    plot(1:100,star(1).data(:,1),'-b',1:100,star(1).data(:,2),'--b',1:100,star(1).data(:,3),'-r',1:100,star(1).data(:,4),'--r', 1:100,star(1).data(:,5),'-g',1:100,star(1).data(:,6),'--g',1:100,star(1).data(:,7),'-m',1:100,star(1).data(:,8),'--m');
    
    frame1 = frame2;
    %     points1 = points2;
    %     features1 = features2;
    %     valid_points1 = valid_points2;
    
    %     figure(1);
    %     imshow(frame2);
    
    % Plot keypoint features.
    %     hold on;
    %     plot(points2);
    %     hold off;
    %
    
end

