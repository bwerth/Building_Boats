%MatLab Code for Boat Project


%Boat Visualization
%Determination of COM
%Waterline Location
%Determination of Boat Displacement
%Determination of COB
%Determine Righting Arm
%Plot of RA vs. Angle

%Boat Design Input, global, localhull?

function res = BoatCode(nfunction, heelangle)


n = nfunction;
theta = heelangle;
hold on;
boatvisual(n,-.5, theta);
res = rightingarm([0,0],[.6,-.2],theta);




%boat cross section
function res = boatvisual(n,d,theta)
y = @(x) 1/n*abs(x).^n-1;
ydeck = @(x) 0;

boatdeck = @(x) y(x)-ydeck(x);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);

%waterline 
x1 = linspace(-5,5,100);
y1 = tand(theta)*x1+d;

%COM, COB
COM = [0,0];
COB = [.6,-.2];

hold on;

%Plotting
fplot(y,[negboatdeck,posboatdeck],'b');
fplot(ydeck, [negboatdeck,posboatdeck], 'b');
plot(x1,y1);
plot(COM(1), COM(2),'r*');
plot(COB(1), COB(2),'g*');
axis([-3, 3, -3, 3]);
end





%calculates the rightingarm 
function res = rightingarm(COM, COB, angle)
    
    %Checking angles
    if angle == 0 || angle == 180
        res = 0;
        
    
    %90 degrees doesn't work with tan, so we have to modify it a bit    
    elseif angle == 90
        angle2 = angle-.01;
         %Creating lines perpendicular to each other at COM and COB, solving for
        %constant
        COMline = @(x) tand(angle2)*COM(1)+x-COM(2);
        COBline = @(x) -1/tand(angle2)*COB(1)+x-COB(2);
        b = fzero(COMline,0);
        c = fzero(COBline,0);


        %Solving for intersection
        Intersect = @(x) tand(angle2) * x + b + 1/tand(angle2) * x - c;
        xIntersect = fzero(Intersect, 0);

        %Calculating Distance  = rightingarm
        res = sqrt((xIntersect-COM(1))^2 + ((tand(angle2)*xIntersect+b) - COM(2))^2);
    

    else
        %Creating lines perpendicular to each other at COM and COB, solving for
        %constant
        COMline = @(x) tand(angle)*COM(1)+x-COM(2);
        COBline = @(x) -1/tand(angle)*COB(1)+x-COB(2);
        b = fzero(COMline,0);
        c = fzero(COBline,0);


        %Solving for intersection
        Intersect = @(x) tand(angle) * x + b + 1/tand(angle) * x - c;
        xIntersect = fzero(Intersect, 0);

        %Calculating Distance  = rightingarm
        res = sqrt((xIntersect-COM(1))^2 + ((tand(angle)*xIntersect+b) - COM(2))^2);
    end 
    


end





function res = boatvisual3D()
f1 = @(x) 1/3*abs(x).^3;
f2 = @(y) 1/6*abs(y).^6;
ftotal = @(x,y) -1.*(2500 - f1(x) - f2(y)).^(1/6);

ezsurf(ftotal,40)
axis([-20,20,-20,20])
end



end