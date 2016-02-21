%calculates the rightingarm 
function res = rightingarm(COM, COB, angle)
    
    %Checking angles
    if angle == 0 || angle == 180
        res = 0;
        
    

    else
%         %Creating lines perpendicular to each other at COM and COB, solving for
%         %constant
%         COMline = @(x) tand(angle)*COM(1)+x-COM(2);
%         COBline = @(x) -1/tand(angle)*COB(1)+x-COB(2);
%         b = fzero(COMline,0);
%         c = fzero(COBline,0);
% 
% 
%         %Solving for intersection
%         Intersect = @(x) tand(angle) * x + b + 1/tand(angle) * x - c;
%         xIntersect = fzero(Intersect, 0);
%         
%         
%         %Line through COM perpendicular to water surface
%         perpenCOMline = @(x) -1/tand(angle) * COM(1) + x - COM(2);
%         a = fzero(perpenCOMline, 0);
%         
%         %Checking to see where the COM and COB are relative to each other
%         watersurface = @(x) (17 - d) + tand(angle)*x;
%         COBlinetowater = @(x) -1/tand(angle) * x + c;
%         COMlinetowater = @(x) -1/tand(angle) * x + a;
%        
%         COMtowater = @(x) COMlinetowater(x) - watersurface(x);
%         COBtowater = @(x) COBlinetowater(x) - watersurface(x);
%         COMwater = fzero(COMtowater, 0);
%         COBwater = fzero(COBtowater, 0);
% 
%         %Calculating Distance  = rightingarm
%          if COMlinetowater(COMwater) > COBlinetowater(COBwater)
%             res = sqrt((xIntersect-COM(1))^2 + ((tand(angle)*xIntersect+b) - COM(2))^2);
%          else 
%             res = -1 * sqrt((xIntersect-COM(1))^2 + ((tand(angle)*xIntersect+b) - COM(2))^2);
%          end
%          
%          
%          
         
         watervector = zeros(1,2);
         %angle
         watervector(1) = cosd(angle);
         
         watervector(2) = sind(angle);
         vectorx = COB(1) - COM(1);
         vectory = COB(2) - COM(2);
         res = watervector(1) * vectorx + watervector(2) * vectory;
         %res = sqrt(vectorx^2 + vectory^2) * cosd(angle);
         %pause
         
         
    end 
    


end

