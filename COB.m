function COB = COB(n,d,theta)
p = 1; %g/cm^3


fun = @(y,z) p*(z./z);
funy = @(y,z) p*y.*(z./z);
funz = @(y,z) p*z.*(z./z);

zmin = @(y) 1/(n^n)*abs(y).^n;
zmax = @(y) 17-d+tand(theta)*y;

watertop = @(y) zmin(y) - zmax(y);
negwater = fzero(watertop, -5);
poswater = fzero(watertop, 5);

totalarea = integral2(fun,negwater,poswater,zmin,zmax);
My = integral2(funy,negwater,poswater,zmin,zmax);
Mz = integral2(funz,negwater,poswater,zmin,zmax);

COB = 1:2;
COB(1) = My./totalarea;
COB(2) = Mz./totalarea;