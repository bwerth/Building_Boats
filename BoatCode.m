%MatLab Code for Boat Project


%Boat Visualization
%Determination of COM
%Waterline Location
%Determination of Boat Displacement
%Determination of COB
%Determine Righting Arm
%Plot of RA vs. Angle

%Boat Design Input, global, localhull?

function res = BoatCode(nfunction, heelangle, COMpt,d, COBpt)


n = nfunction;
theta = heelangle;
waterline = d;
COMthing = COMpt;
COBthing = COBpt;
hold on;
boatvisual(n,waterline, theta, COMthing, COBthing);





%boat cross section
function res = boatvisual(n,d,theta, COMpt, COBpt)
y = @(x) (1/n^n)*abs(x).^n;
ydeck = @(x) 17;

boatdeck = @(x) y(x)-ydeck(x);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);

%waterline 
x1 = linspace(-20,20,100);
y1 = tand(theta)*x1+17-d;

%COM, COB
COM = COMpt;
COB = COBpt;

hold on;

%Plotting
fplot(y,[negboatdeck,posboatdeck],'b');
fplot(ydeck, [negboatdeck,posboatdeck], 'b');
plot(x1,y1);
plot(COM(1), COM(2),'r*');
plot(COB(1), COB(2),'g*');
axis([-20, 20, -5, 20]);
end









function res = boatvisual3D()
f1 = @(x) 1/3*abs(x).^3;
f2 = @(y) 1/6*abs(y).^6;
ftotal = @(x,y) -1.*(2500 - f1(x) - f2(y)).^(1/6);

ezsurf(ftotal,40)
axis([-20,20,-20,20])
end



end