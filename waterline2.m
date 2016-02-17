function y = waterline2(theta,n)


y = fzero(@submerged,1);


function res=submerged(d)
    y=0;
    funboat = @(y,z).0317*z./z;
    funwater = @(y,z) 1*z./z;
    
    
    
    %calculates the two corners of the boat

    boathull = @(y)1/(n^n)* abs(y).^n;
    deck = @(y) 17;
    length=35;
    boatdeck = @(y) boathull(y)-deck(y);
    negboatdeck = fzero(boatdeck,-5);
    posboatdeck = fzero(boatdeck,5);
    
    
    %calculates the intersection of boathull and water
    
    watersurface =@(y) (17 - d) + tand(theta)*y;
    watertop = @(y) boathull(y) - watersurface(y);
    negwater = fzero(watertop, -5);
    poswater = fzero(watertop, 5);
    
    
    %calculates the intersection of the deck with the water
    
    deckwater = @(y) watersurface(y) - deck(y);
    deckhitwater = fzero(deckwater, 5);
    
    
    
    totalweight = length*integral2(funboat,negboatdeck,posboatdeck,boathull,17)+1120;


    %if poswater < deckhitwater

        subarea = length*integral2(funwater,negwater,poswater,boathull,watersurface);
        res = totalweight-subarea;
    
    %else
     %   res = 0;
    %end
end
end