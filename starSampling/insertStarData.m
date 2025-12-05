function [ data ] = insertStarData(star, frame2)

CoMx = star(1).CoM(1);
CoMy = star(1).CoM(2);

star(1).data = zeros(100,4);
star(1).data(:,1) = BW(CoMy-99:CoMy,CoMx);
star(1).data(:,2) = BW(CoMy:CoMy+99,CoMx);
star(1).data(:,3) = BW(CoMy,CoMx:CoMx+99);
star(1).data(:,4) = BW(CoMy,CoMx-99:CoMx);

star(1).data(:,1) = flipud(star(1).data(:,1));
star(1).data(:,4) = flipud(star(1).data(:,4));

% TEST DRAW SAMPLES

figure(3);
imshow(frame2);
line([CoMx,CoMx],[CoMy-99,CoMy]);
line([CoMx,CoMx],[CoMy,CoMy+99]);
line([CoMx,CoMx+99],[CoMy,CoMy]);
line([CoMx-99,CoMx],[CoMy,CoMy]);

% END TEST SAMPLES

end