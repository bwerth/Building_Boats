%This function will iterate through all the values of theta from 0 to 180
%and find the righting arm values. It will also plot them so that we can
%find the AVS. We will use this with different values of n to find a nice
%function for the hull


function res = AVSPlot()
    n = 5;
    hold on;
    iguessd = 10;
    iguessnegwater = -5;
    iguessposwater = 5;
    for theta = 0:1:9
        if theta == 90 || theta == 180
            continue
        end
%         subplot(4,3,k);
%         theta = k*17 + 5;
        COMpt = COM(n);
        water = waterline2(theta, n, iguessd, iguessnegwater, iguessposwater);
        COBpt = COB(theta, n, water(1), iguessnegwater, iguessposwater);
        iguessd = water(1);
        iguessnegwater = water(2);
        iguessposwater = water(3);
        %keyboard;
        
        %BoatCode(n,theta, COMpt, water, COBpt);
        RA = rightingarm(COMpt, COBpt, theta);
        %myfunction(theta, n, water, COMpt, COBpt);
        plot(theta, RA, 'r*');
    end 
    
    axis([0 180 -10 10]);
    
    
end    



%Things to do:
%Fix Waterline
%Add weights/3D
    