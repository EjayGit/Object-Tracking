% testMovement8

sampleNum = size(star(1).data,2);
maxTestNum = 40;
resultStore = zeros(maxTestNum,8);

for sample = 1 : 1 : sampleNum
    
    newData = star(1).data(31:70,sample,1);
    for testNum = 1 : 1 : maxTestNum
        
        inital = 31 - 20 + testNum;
        last = inital + 39;
        prevData = star(1).data(inital:last,sample,2);
        
        resultStore(testNum,sample) = sum(newData-prevData);
        
    end
end

figure;
plot(1:40,resultStore(:,1,1),'-b',1:40,resultStore(:,2,1),'--b',1:40,resultStore(:,3,1),'-r',1:40,resultStore(:,4,1),'--r', 1:40,resultStore(:,5,1),'-g',1:40,resultStore(:,6,1),'--g',1:40,resultStore(:,7,1),'-m',1:40,resultStore(:,8,1),'--m');

