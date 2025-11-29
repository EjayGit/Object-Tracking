clear all;
file = VideoReader('Birds2.mp4');
startFrame = 1;
for frameCount = 1 : 1 : startFrame
    frame = readFrame(file);
end
for frameCount = 1 : 1 : (int16(file.Duration * file.FrameRate) - startFrame)
    frame = readFrame(file);
    imshow(frame);
    
end