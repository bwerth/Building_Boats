function y = waterline(mass,theta,n)
y = 0;
fun = @(z,y) z./z;
zmin = @(z)abs(y)^2-1;
totalarea = integral2(fun,-1,1,zmin,0);
for d = linspace(0,10,100)
    ymax = nthroot(-d+1,n);
    ymin = -ymax;
    subarea = integral2(fun,zmin,-d,ymin,ymax);
    if subarea == .5*totalarea
        y = d;
    end
end