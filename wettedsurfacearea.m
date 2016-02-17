function res = wettedsurfacearea(theta,d,n)
funwater = @(y,z) 1*z./z;

deck = @(y) 17*y./y;
watersurface = @(y) (17-d) + tand(theta)*y;
boathull = @(y)1/(n^n)* abs(y).^n;
dboathull = @(y) sqrt(1+(n*y.^(n-1)).^2);
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
        curve = length*integral(dboathull,negwater,poswater);
        crosssection = 2*integral2(funwater,negwater,poswater,boathull,watersurface);
        res = curve+crosssection;
elseif theta < 90
        %checking for two cases when below 90
    if deckhitwater < poswater
            curve = length*(integral(dboathull,negwater,posboatdeck)+(posboatdeck-deckhitwater));
            crosssection = 2*(integral2(funwater,negwater, deckhitwater, boathull, watersurface) + integral2(funwater, deckhitwater, posboatdeck, boathull, deck));
            res = curve +crosssection;
            %subarea = 50;
    else    
            curve = length*integral(dboathull,negwater,poswater);
            crosssection = 2*integral2(funwater,negwater,poswater,boathull,watersurface);
            res = curve+crosssection;
            %subarea = 10;
    end
else       
    if deckhitwater > negwater
            curve = length*(integral(dboathull,poswater,posboatdeck)+(posboatdeck-deckhitwater));
            crosssection = length*(integral2(funwater,deckhitwater,poswater,watersurface,deck) + integral2(funwater,poswater,posboatdeck,boathull,deck));
            res = curve+crosssection;
    else
            curve = length*(integral(dboathull,negwater,negboatdeck)+integral(dboathull,poswater,posboatdeck)+(posboatdeck-negboatdeck));
            crosssection = length*(integral2(funwater,negboatdeck,negwater,boathull,deck) + integral2(funwater,negwater,poswater,watersurface,deck)+ integral2(funwater,poswater,posboatdeck,boathull,deck));
            res = curve+crosssection;
    end
end 