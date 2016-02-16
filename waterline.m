function y = waterline(theta,n)
syms d
y=0;
funboat = @(y,z) 31.7*z./z;
funwater = @(y,z) 1000*z./z;
zmin = @(y)abs(y).^n-1;
totalarea = integral2(funboat,-1,1,zmin,0);
for d = linspace(0,1,10000)
ymax = nthroot(d,n);
ymin = -ymax;
zmax =@(y)-d+tand(theta)*y;
subarea = integral2(funwater,ymin,ymax,zmin,zmax);
if (totalarea-subarea)<=.0001
    y = d;
end
end
end