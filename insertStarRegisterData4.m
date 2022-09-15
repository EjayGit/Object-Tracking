function [ star ] = insertStarRegisterData4(star, frame)

CoMx = 150;%star(1).CoM(1);
CoMy = 450;%star(1).CoM(2);

star.data(:,1) = improfile(frame,[CoMx,CoMx],[CoMy+99.5,CoMy-99.5],200);
star.data(:,2) = improfile(frame,[CoMx+99.5,CoMx-99.5],[CoMy-99.5,CoMy+99.5],199);
star.data(:,3) = improfile(frame,[CoMx+99,CoMx-99],[CoMy,CoMy],199);
star.data(:,4) = improfile(frame,[CoMx+99,CoMx-99],[CoMy+99,CoMy-99],199);

% TEST DRAW SAMPLES

figure;
imshow(frame);
line([CoMx,CoMx],[CoMy+99,CoMy-99]);
line([CoMx+99,CoMx-99],[CoMy-99,CoMy+99]);
line([CoMx+99,CoMx-99],[CoMy,CoMy]);
line([CoMx+99,CoMx-99],[CoMy+99,CoMy-99]);

% TEST DRAW SAMPLES END

end

