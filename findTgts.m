function [ newTgtsCoM, find ] = findTgts(star)

% Determine if new targets need to be found.
% Current condition: if 1 tgt exists, do not find more.
if star(1).tgt == 0
    find = 1;
elseif star(1).tgt == 1
    find = 0;
else 
    error('Error at findTgts.m, line 7-13');
end


% If so, then find new targets
if find == 1
    % Find tgts (newTgtsCoM)
    newTgtsCoM = searchNewTgt(searchStar, frame1);
elseif find == 0
    % Do not find tgts and return with same set of stars.
    return
else 
    error('Error at findTgts.m, line 17-25');
end

end

