function res = displacement(theta,d,n)
funwater = @(y,z) 1*z./z;

deck = @(y) 17;
watersurface = @(y) (17-d) + tand(theta)*y;
boathull = @(y)1/(n^n)* abs(y).^n;
length=35;
boatdeck = @(y) boathull(y)-deck(y);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);
watertop = @(y) boathull(y) - watersurface(y);
negwater = fzero(watertop, -5);
poswater = fzero(watertop, 5);
deckwater = @(y) watersurface(y) - deck(y);
deckhitwater = fzero(deckwater, 5);
if theta == 0
    res = length*integral2(funwater,negwater,poswater,boathull,watersurface);
elseif theta < 90
        %checking for two cases when below 90
    if deckhitwater < poswater
            res = length * (integral2(funwater,negwater, deckhitwater, boathull, watersurface) + integral2(funwater, deckhitwater, posboatdeck, boathull, deck));
            %subarea = 50;
    else    
            res = length * integral2(funwater,negwater,poswater,boathull,watersurface);
            %subarea = 10;
    end
else       
    if deckhitwater > negwater
            res = length*(integral2(funwater,deckhitwater,poswater,watersurface,deck) + integral2(funwater,poswater,posboatdeck,boathull,deck));
    else
            res = length*(integral2(funwater,negboatdeck,negwater,boathull,deck) + integral2(funwater,negwater,poswater,watersurface,deck)+ integral2(funwater,poswater,posboatdeck,boathull,deck));
    end
end 