%MatLab Code for Boat Project



%boat cross section
x = linspace(-5,5,100);
y = abs(x).^2-1;

%waterline
x1 = linspace(-5,5,100);
y1 = 4*(x-(x-1))-1;

hold on;

plot(x,y);
plot(x1,y1);

axis([-5, 5, -3, 5]);

