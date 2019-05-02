function visualizeTracks(allTimeStateEstimates, allTimeTrackedActors, ...
                         allTimeCar1, allTimeCar2, allTimeCar3, allTimeCar4)
% This function visualizes the tracks of all the actors in the ground truth
% and state estimations for comparison.

% Lighter colors represent the action of the actor early in time, whereas
% the darker colors represent the more recent actions.

    % number of state estimates (total time steps) in allTimeStateEstimates:
    num_steps = numel(allTimeStateEstimates);
    for i = 2:num_steps-1
        estX = allTimeStateEstimates{i-1}(1,allTimeTrackedActors{i});
        estY = allTimeStateEstimates{i-1}(3,allTimeTrackedActors{i});
        
        c1X = allTimeCar1{i}(1);
        c1Y = allTimeCar1{i}(2);
        c2X = allTimeCar2{i}(1);
        c2Y = allTimeCar2{i}(2);
        c3X = allTimeCar3{i}(1);
        c3Y = allTimeCar3{i}(2);
        c4X = allTimeCar4{i}(1);
        c4Y = allTimeCar4{i}(2);
        
        scatter(estX,estY,'k','+')
        hold on
        scatter(c1X,c1Y,'r','o')
        hold on
        scatter(c2X,c2Y,'g','o')
        hold on
        scatter(c3X,c3Y,'b','o')
        hold on
        scatter(c4X,c4Y,'m','o')
        hold on
    end
    legend('CSL-Tracks', 'Car1 True-Track', 'Car2 True-Track', ...
           'Car3 True-Track', 'Car4 True-Track', 'Location','SouthWest')
    hold off
end

