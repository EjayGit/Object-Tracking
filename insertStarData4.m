function [ star ] = insertStarData4(star, frame2)

CoMx = star(1).CoM(1);
CoMy = star(1).CoM(2);

star(1).data = zeros(100,4);
star(1).data(:,1) = improfile(frame2,[CoMx,CoMx],[CoMy,CoMy-99]);
%star(1).data(:,1) = frame2(CoMy:-1:CoMy-99,CoMx);
star(1).data(:,2) = frame2(CoMy:CoMy+99,CoMx);
star(1).data(:,3) = frame2(CoMy,CoMx:CoMx+99);
star(1).data(:,4) = frame2(CoMy,CoMx:-1:CoMx-99);

%star(1).data(:,1) = flipud(star(1).data(:,1));
%star(1).data(:,4) = flipud(star(1).data(:,4));

% TEST DRAW SAMPLES

figure(1);
imshow(frame2);
line([CoMx,CoMx],[CoMy,CoMy-99]);
line([CoMx,CoMx],[CoMy,CoMy+99]);
line([CoMx,CoMx+99],[CoMy,CoMy]);
line([CoMx,CoMx-99],[CoMy,CoMy]);

% END TEST SAMPLES

end