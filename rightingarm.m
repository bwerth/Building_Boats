%calculates the rightingarm 
function res = rightingarm(COM, COB, angle)
    
    %Checking angles
    if angle == 0 || angle == 180
        res = 0;
        
    
    %90 degrees doesn't work with tan, so we have to modify it a bit    
    elseif angle == 90
        angle2 = angle-.01;
         %Creating lines perpendicular to each other at COM and COB, solving for
        %constant
        COMline = @(x) tand(angle2)*COM(1)+x-COM(2);
        COBline = @(x) -1/tand(angle2)*COB(1)+x-COB(2);
        b = fzero(COMline,0);
        c = fzero(COBline,0);


        %Solving for intersection
        Intersect = @(x) tand(angle2) * x + b + 1/tand(angle2) * x - c;
        xIntersect = fzero(Intersect, 0);

        %Calculating Distance  = rightingarm
        res = sqrt((xIntersect-COM(1))^2 + ((tand(angle2)*xIntersect+b) - COM(2))^2);
    

    else
        %Creating lines perpendicular to each other at COM and COB, solving for
        %constant
        COMline = @(x) tand(angle)*COM(1)+x-COM(2);
        COBline = @(x) -1/tand(angle)*COB(1)+x-COB(2);
        b = fzero(COMline,0);
        c = fzero(COBline,0);


        %Solving for intersection
        Intersect = @(x) tand(angle) * x + b + 1/tand(angle) * x - c;
        xIntersect = fzero(Intersect, 0);

        %Calculating Distance  = rightingarm
        res = sqrt((xIntersect-COM(1))^2 + ((tand(angle)*xIntersect+b) - COM(2))^2);
    end 
    


end

