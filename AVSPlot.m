%This function will iterate through all the values of theta from 0 to 180
%and find the righting arm values. It will also plot them so that we can
%find the AVS. We will use this with different values of n to find a nice
%function for the hull


function res = AVSPlot()
    n = 5;
    hold on;
    for theta = 0:1:30
        COMpt = COM(n);
        water = waterline2(theta, n);
        COBpt = COB(n,water,theta);
        %BoatCode(n,theta, COMpt, water, COBpt);
        RA = rightingarm(COMpt, COBpt, theta);
        plot(theta, RA, 'r*');
    end
        
    
    
    
end    



%Things to do:
%fix waterline
%Add 90 degrees over part
%Add weights/3D
    