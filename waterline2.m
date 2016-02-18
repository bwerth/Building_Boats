function y = waterline2(theta,n, estimate, negwaterestimate, poswaterestimate)

% if theta <= 80
%     y = fzero(@submerged,12);
% elseif theta > 80 && theta <=100
%     y = fzero(@submerged, 15);
% elseif theta >100 && theta < 110
%     y = fzero(@submerged, 12);
% elseif theta >= 110
   
% end    


y = submerged(10);



    
    
% y = 1:3;
% y(1) = fzero(@submerged, estimate); 
% y(2) = negwater;
% y(3) = poswater;

function res = submerged(d)
    y=0;
    funboat = @(y,z).0317*z./z;
    funwater = @(y,z) 1.0*z./z;
    
    
    
    %calculates the two corners of the boat

    boathull = @(y) 1/(n^n)* abs(y).^n;
    deck = @(y) 17 *y./y;
    length=35;
    boatdeck = @(y) boathull(y)-deck(y);
    negboatdeck = fzero(boatdeck,-5);
    posboatdeck = fzero(boatdeck,5);
    
    
  
    %Calculates weight of boat
    totalweight = length*integral2(funboat,negboatdeck,posboatdeck,boathull,deck)+1120;
    
    
    %calculates the intersection of boathull and water
    
    watersurface =@(y) (17 - d) + tand(theta)*y;
    watertop = @(y) boathull(y) - watersurface(y);
    
 
    negwater = fzero(watertop, negwaterestimate);
    poswater = fzero(watertop, poswaterestimate);


        
    
    if theta == 0
        submass = length*integral2(funwater,negwater,poswater,boathull,watersurface);
        
    elseif theta < 90
        
        %calculates the intersection of the deck with the water
        deckwater = @(y) watersurface(y) - deck(y);
        deckhitwater = fzero(deckwater, 5);
        
        %checking for two cases when below 90
        
        if deckhitwater < poswater
             submass = length * (integral2(funwater,negwater, deckhitwater, boathull, watersurface) + integral2(funwater, deckhitwater, posboatdeck, boathull, deck));
            %subarea = 50;
        else    
            submass = length * integral2(funwater,negwater,poswater,boathull,watersurface);
            %subarea = 10;
        end
        
        
    else    
        
        %calculates the intersection of the deck with the water

        deckwater = @(y) watersurface(y) - deck(y);
        deckhitwater = fzero(deckwater, 5);
        
        
        %checking for two cases when over 90    
  
        
        if deckhitwater > negwater
            %submass = length*(integral2(funwater,deckhitwater,poswater,watersurface,deck) + integral2(funwater,poswater,posboatdeck,boathull,deck));
            submass = 1;
        else
            %submass = length*(integral2(funwater,negboatdeck,negwater,boathull,deck) + integral2(funwater,negwater,poswater,watersurface,deck)+ integral2(funwater,poswater,posboatdeck,boathull,deck));
            submass = -1;
        end
        
       
     end   
    %keyboard;
    %res = totalweight-submass;
    res = submass;
    

end
end