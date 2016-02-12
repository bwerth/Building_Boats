%MatLab Code for Boat Project


%Boat Visualization
%Determination of COM
%Waterline Location
%Determination of Boat Displacement
%Determination of COB
%Determine Righting Arm
%Plot of RA vs. Angle

%Boat Design Input, global, localhull?


%boat cross section

y = @(x) abs(x).^2-1;
ydeck = @(x) 3;

%waterline
x1 = linspace(-5,5,100);
y1 = 2*(x-(x-1))-1;

hold on;

fplot(y,[-2,2],'b');
fplot(ydeck, [-2,2], 'b');
plot(x1,y1);

axis([-5, 5, -3, 5]);

