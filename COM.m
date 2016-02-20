function COM = COM(n)
p = .0317; %g/cm^3
length = 30;

fun = @(y,z) p*(z./z);
funy = @(y,z) p*y.*(z./z);
funz = @(y,z) p*z.*(z./z);


zmin = @(y) 12.5*(abs(y)/4.5).^n;
deck = @(y) 17*y./y;
boatdeck = @(y) zmin(y)-deck(y);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);
totalmass = integral2(fun,negboatdeck,posboatdeck,zmin,deck)*length;


My = integral2(funy,negboatdeck,posboatdeck,zmin,deck)*length;
Mz = integral2(funz,negboatdeck,posboatdeck,zmin,deck)*length;


COMboat = 1:2;
COMboat(1) = My./totalmass;
COMboat(2) = Mz./totalmass;

COM = 1:2;
COM(1) = COMboat(1);
COM(2) = (totalmass * COMboat(2) + 0 * 300 + 3.3 * 720 + 25 * 100)/(totalmass + 1120);
