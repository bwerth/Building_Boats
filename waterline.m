function y = waterline(theta,n)

syms d
y=0;
funboat = @(y,z).0317*z./z;
funwater = @(y,z) 1*z./z;

zmin = @(y)1/(n^n)* abs(y).^n;
deck = @(y) 17;
boatdeck = @(y) zmin(y)-deck(y);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);

totalweight = integral2(funboat,negboatdeck,posboatdeck,zmin,17);

for d = 0:.01:16.99
    

    zmax =@(y) (17 - d) + tand(theta)*y;
    watertop = @(y) zmin(y) - zmax(y);
    negwater = fzero(watertop, -5);
    poswater = fzero(watertop, 5);

    subarea = integral2(funwater,negwater,poswater,zmin,zmax);
    if (totalweight-subarea)<=.01
        y = d;
    end
end
end