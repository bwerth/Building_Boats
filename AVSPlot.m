%This function will iterate through all the values of theta from 0 to 180
%and find the righting arm values. It will also plot them so that we can
%find the AVS. We will use this with different values of n to find a nice
%function for the hull


function res = AVSPlot()
    n = 2;
    hold on;
    iguessd = 3;
    for theta = 1:10:89
%         subplot(4,3,k);
%         theta = k*17 + 5;
        COMpt = COM(n);
        water = waterline2(theta, n, iguessd);
        COBpt = COB(theta, n, water(1));
        iguessd = water(1);
        RA = rightingarm(COMpt, COBpt, theta);
        plot(theta, RA, 'r*');
    end 
    iguessd = 10;
    for theta = 91:10:179
%         subplot(4,3,k);
%         theta = k*17 + 5;
        COMpt = COM(n);
        water = waterline2(theta, n, iguessd);
        COBpt = COB(theta, n, water(1));
        iguessd = water(1);
        RA = rightingarm(COMpt, COBpt, theta);
        plot(theta, RA, 'r*');
    end 
%     axis([0 180 -10 10]);
     
    
end