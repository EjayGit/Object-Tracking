function [ gradients ] = findGrads(data)

gradients = diff(data);

% TEST

% figure('Name','Gradients');
% plot(1:200, gradients(:,89),'-b');
% figure('Name','Gradients');
% plot(1:200, gradients(:,90),'-g');
% figure('Name','Gradients');
% plot(1:200, gradients(:,91),'-r');
% figure('Name','Gradients');
% plot(1:200, gradients(:,4),'-m');

% TEST END

end

