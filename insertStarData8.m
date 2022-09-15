function [ star ] = insertStarData8(star, frame)

CoMx = star(1).CoM(1);
CoMy = star(1).CoM(2);

star(1).data(:,1,1) = improfile(frame,[CoMx,CoMx],[CoMy,CoMy-99],100);
star(1).data(:,2,1) = improfile(frame,[CoMx,CoMx],[CoMy,CoMy+99],100);
star(1).data(:,3,1) = improfile(frame,[CoMx,CoMx+99],[CoMy,CoMy],100);
star(1).data(:,4,1) = improfile(frame,[CoMx,CoMx-99],[CoMy,CoMy],100);
star(1).data(:,5,1) = improfile(frame,[CoMx,CoMx+99],[CoMy,CoMy-99],100);
star(1).data(:,6,1) = improfile(frame,[CoMx,CoMx-99],[CoMy,CoMy+99],100);
star(1).data(:,7,1) = improfile(frame,[CoMx,CoMx+99],[CoMy,CoMy+99],100);
star(1).data(:,8,1) = improfile(frame,[CoMx,CoMx-99],[CoMy,CoMy-99],100);


% TEST DRAW SAMPLES
figure;
imshow(frame);
line([CoMx,CoMx],[CoMy,CoMy-99]);
line([CoMx,CoMx],[CoMy,CoMy+99]);
line([CoMx,CoMx+99],[CoMy,CoMy]);
line([CoMx,CoMx-99],[CoMy,CoMy]);
line([CoMx,CoMx+99],[CoMy,CoMy-99]);
line([CoMx,CoMx-99],[CoMy,CoMy+99]);
line([CoMx,CoMx+99],[CoMy,CoMy+99]);
line([CoMx,CoMx-99],[CoMy,CoMy-99]);

% TEST DRAW SAMPLES END

end

