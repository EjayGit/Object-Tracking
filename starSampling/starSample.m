function [ star ] = starSample(star, frame2)

% Check for new possible targets using (Harris) detector


% Insert CoMs from new possible targets.
star(1).CoM = [571 284];

% Insert data into match CoM/star matrix.
star(1).data = insertStarData(star, frame2);

% For old possible targets, ID new edges, and find new CoM. Edit CoM.


end