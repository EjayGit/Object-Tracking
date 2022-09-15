
% Init workspace.
clear all;

% Load video into obj.
fileIn = VideoReader('IR1k.mp4');

% Set start frame.
startFrame = 15;
noFrames = 20;%(fileIn.Duration * fileIn.FrameRate);

star.CoM = [];
star.data = zeros(100,8,2);
star.boundaries = [];

% Set start frame.
count = 0;
for frameCount = 1 : 1 : startFrame-1
    frame = readFrame(fileIn);
    count = count + 1;
end

% Read and show frames from start frame to last frame.
for frameCount = 1 : 1 : noFrames
    
    frame2 = readFrame(fileIn);
    frame2 = rgb2gray(frame2);
    
    star(1).CoM = [150 450];
    star(1) = insertStarData8(star, frame2);
    if frameCount > 1
        testMovement8;
    end

    figure;
    plot(1:199,starRegister1.data(:,3),'-b',1:199,starRegister2.data(:,3),'--b');%,1:199,starRegister1.data(:,2),'-g',1:199,starRegister1.data(:,3),'-r',1:199,starRegister1.data(:,4),'-m');
    %plot(1:100,star(1).data(:,1,1),'-b',1:100,star(1).data(:,2,1),'--b',1:100,star(1).data(:,3,1),'-r',1:100,star(1).data(:,4,1),'--r', 1:100,star(1).data(:,5,1),'-g',1:100,star(1).data(:,6,1),'--g',1:100,star(1).data(:,7,1),'-m',1:100,star(1).data(:,8,1),'--m');
    
    frame1 = frame2;
    star(1).data(:,:,2) = star(1).data(:,:,1);

end

