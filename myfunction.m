function [negboatdeck,posboatdeck,negwater,poswater,deckhitwater] = myfunction(theta, n, d)  
    %calculates the intersection of the boathull and the deck
    boathull = @(y) 17*abs(y/17).^n;
    deck = @(y) 17;
    boatdeck = @(y) deck(y)-boathull(y);
    negboatdeck = fzero(boatdeck,-5);
    posboatdeck = fzero(boatdeck,5);
    %calculates the intersection of the deck with the water
     %calculates the intersection of boathull and water
    watersurface =@(y) (17 - d) + tand(theta)*y;
    watertop = @(y) boathull(y) - watersurface(y);
    deckwater = @(y) watersurface(y) - deck(y);
    deckhitwater = fzero(deckwater, 5); 
    negwater = 0;
    poswater = 0;
    if deckhitwater<=17 && deckhitwater>0
        negwater = fzero(watertop,-17);
    elseif deckhitwater<0 && deckhitwater>=-17
        poswater = fzero(watertop,17);
    else
        negwater = fzero(watertop,-17);
        poswater = fzero(watertop,17);
    end    
end