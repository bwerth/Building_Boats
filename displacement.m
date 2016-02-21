function res = displacement(theta,d,n)
funwater = @(y,z) 1*z./z;
height = 17;

deck = @(y)17*y./y;
watersurface = @(y) (17-d) + tand(theta)*y;
% boathull = @(y)1/(n^n)* abs(y).^n;
boathull = @(y) height*abs(y/height).^n;
length=35;
boatdeck = @(y) boathull(y)-deck(y);
watertop = @(y) boathull(y) - watersurface(y);
deckwater = @(y) watersurface(y) - deck(y);
[negboatdeck,posboatdeck,negwater,poswater,deckhitwater] = myfunction(theta,n,d,[0 0],[0 0]);
if theta == 0
    res = length*integral2(funwater,negwater,poswater,boathull,watersurface);
elseif theta < 90
        %checking for two cases when below 90
%     if isnan(deckhitwater)==1
%         if d < 0
%             res = -1000;
%         else
%             res = 1000;
%         end
% else-
    if deckhitwater < poswater
        'case 1';
            res = length * (integral(@(y) watersurface(y)-boathull(y),negwater, deckhitwater) + integral(@(y) deck(y)-boathull(y), deckhitwater, posboatdeck));
            %subarea = 50;
    else    
        'case 2';
            res = length * integral(@(y) watersurface(y)-boathull(y),negwater,poswater);
            %subarea = 10;
    end
else
%     if isnan(deckhitwater)==1
%         if d < 0
%             res = -1000;
%         else
%             res = 1000;
%         end
% else
    if deckhitwater > negwater && deckhitwater < poswater
        'case 1'
            res = length*(integral(@(y) deck(y)-watersurface(y),deckhitwater,poswater) + integral(@(y) deck(y)-boathull(y),poswater,posboatdeck));
    elseif deckhitwater > negwater && deckhitwater > poswater
            res = 0; 
    else
        'case 2'
            res = length*(integral(@(y) deck(y)-boathull(y),negboatdeck,negwater) + integral(@(y) deck(y)-watersurface(y),negwater,poswater)+ integral(@(y) deck(y)-boathull(y),poswater,posboatdeck));
    end
end 
end