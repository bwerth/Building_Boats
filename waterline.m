function y = waterline(theta,n)
y = 0;
fun = @(y,z) z./z;
zmin = @(y)abs(y).^n-1;
totalarea = integral2(fun,-1,1,zmin,0);
for d = linspace(0,10,1000)
    ymax = nthroot(d,n);
    ymin = -ymax;
    zmax = @(y)-d+tan(theta)*y;
    subarea = integral2(fun,ymin,ymax,zmin,zmax);
    if abs(subarea-.5*totalarea) <= .01
        y = d;
    end
end