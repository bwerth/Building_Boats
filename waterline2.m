function y = waterline2(theta,n, estimate)
height = 17;

%y = submerged(10);
y = 1:3;
y(1) = fzero(@submerged,estimate); 
y(2) = negwater;
y(3) = poswater;

function res = submerged(d)
    y=0;
%     funboat = @(y,z) .0317*z./z; %g/cm^3
%     funwater = @(y,z) 1.0*z./z;
    
    %calculates the two corners of the boat

    %boathull = @(y) 12.5*(abs(y)/4.5).^n;
    boathull = @(y) height*abs(y/height).^n;
    deck = @(y) height*y./y;
    length= 35;
%     boatdeck = @(y) boathull(y)-deck(y);
%     negboatdeck = fzero(boatdeck,-5);
%     posboatdeck = fzero(boatdeck,5);
    
    
    %calculates the intersection of boathull and water
    
%     watersurface = @(y) (height - d) + tand(theta)*y;
    
  
%     x = sym('x');
%     boathullprox = x^n;
%     watersurfaceprox = height-d + tand(theta)*x;
%     func = boathullprox - watersurfaceprox;
%     p = sym2poly(func);
%     roots_p = roots(double(p));
%     roots_p = roots_p(imag(roots_p)==0);
% 
% 
%     negwater = min(roots_p);
%     poswater = max(roots_p);
    
    [negboatdeck,posboatdeck,negwater,poswater,deckhitwater] = myfunction(theta,n,d,[0 0],[0 0]);
    %Calculates weight of boat
    totalweight = length*.0317*integral(@(y) deck(y)-boathull(y),negboatdeck,posboatdeck)+1120;

    submass = displacement(theta,d,n);
    
    if submass == -1000 || submass == 1000
        res = submass;
    else
        res = totalweight-submass;
    end
        
        %Checking for the angles

        
        
     
    %keyboard;
    
    %res = submass;
    

end
end