function COM = COM(n)
p = .0317; %g/cm^3
length = 35;

fun = @(y,z) p*(z./z);
funy = @(y,z) p*y.*(z./z);
funz = @(y,z) p*z.*(z./z);


zmin = @(y) (1/(n^n)) * abs(y).^n;
deck = @(y) 17;
boatdeck = @(y) zmin(y)-deck(y);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);
totalarea = integral2(fun,negboatdeck,posboatdeck,zmin,17)*length;


My = integral2(funy,negboatdeck,posboatdeck,zmin,17)*length;
Mz = integral2(funz,negboatdeck,posboatdeck,zmin,17)*length;


COM = 1:2;
COM(1) = My./totalarea;
COM(2) = Mz./totalarea;
