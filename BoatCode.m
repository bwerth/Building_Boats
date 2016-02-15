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

y = @(x) 1/5*abs(x).^5-1;
ydeck = @(x) 2;

boatdeck = @(x) y(x)-ydeck(x);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);

%waterline
x1 = linspace(-5,5,100);
y1 = tand(0)*x1+.5;

hold on;


fplot(y,[negboatdeck,posboatdeck],'b');
fplot(ydeck, [negboatdeck,posboatdeck], 'b');
plot(x1,y1);

axis([-5, 5, -3, 5]);

% f1 = @(x) 1/3*abs(x).^3;
% f2 = @(y) 1/6*abs(y).^6;
% ftotal = @(x,y) -1.*(2500 - f1(x) - f2(y)).^(1/6);
% 
% ezsurf(ftotal,40)
% axis([-20,20,-20,20])