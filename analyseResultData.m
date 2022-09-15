function [ xMove, yMove ] = analyseResultData(resultData)

figure;
plot(1:99,resultData(:,1),'-b',1:99,resultData(:,2),'-g',1:99,resultData(:,3),'-r',1:99,resultData(:,4),'-m');

end