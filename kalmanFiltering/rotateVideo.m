writerObj = VideoWriter('Birds2','MPEG-4');
writerObj.FrameRate = 29.981141861768947;
open(writerObj);

for frameCount = 1 : 1 : 4711
    frame = readFrame(video.file);
    frame = imrotate(frame,270);
    writeVideo(writerObj, frame);
end

close(writerObj);