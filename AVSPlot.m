%This function will iterate through all the values of theta from 0 to 180
%and find the righting arm values. It will also plot them so that we can
%find the AVS. We will use this with different values of n to find a nice
%function for the hull


function res = AVSPlot()
    n = 5;
    hold on;
    for theta = 0:.5:180
        rightingarm = BoatCode(n, theta);
        plot(theta, rightingarm, 'r*');
    end
        
    
    
    
end    
    