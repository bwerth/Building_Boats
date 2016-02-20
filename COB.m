function COB = COB(theta, n, d)
p = 1.0; %g/cm^3
length = 30;


%Density stuff
fun = @(y,z) p*(z./z);
funy = @(y,z) p*y.*(z./z);
funz = @(y,z) p*z.*(z./z);

%Boat equations
boathull = @(y) 12.5* (abs(y)/4.5).^n;
deck = @(y) 17 *y./y;
boatdeck = @(y) boathull(y)-deck(y);
negboatdeck = fzero(boatdeck,-5);
posboatdeck = fzero(boatdeck,5);

%Water equations
watersurface = @(y) 17-d + tand(theta)*y;


  x = sym('x');
    boathullprox = x^n;
    watersurfaceprox = 17-d + tand(theta)*x;
    func = boathullprox - watersurfaceprox;
    p = sym2poly(func);
    roots_p = roots(double(p));
    roots_p = roots_p(imag(roots_p)==0);

    

    negwater = min(roots_p);
    poswater = max(roots_p);
    
    



%Conditionals based on angle

if theta == 0
    totalmass = length * integral2(fun,negwater,poswater,boathull,watersurface);
    My = length * integral2(funy,negwater,poswater,boathull,watersurface);
    Mz = length * integral2(funz,negwater,poswater,boathull,watersurface);

elseif theta < 90

    %calculates the intersection of the deck with the water
    deckwater = @(y) watersurface(y) - deck(y);
    deckhitwater = fzero(deckwater, 5);

    %checking for two cases when below 90

    if deckhitwater < poswater
         totalmass = length * (integral2(fun,negwater, deckhitwater, boathull, watersurface) + integral2(fun, deckhitwater, posboatdeck, boathull, deck));
         My = length * (integral2(funy,negwater, deckhitwater, boathull, watersurface) + integral2(funy, deckhitwater, posboatdeck, boathull, deck));
         Mz = length * (integral2(funz,negwater, deckhitwater, boathull, watersurface) + integral2(funz, deckhitwater, posboatdeck, boathull, deck));
        %subarea = 50;
    else    
        totalmass = length * integral2(fun,negwater,poswater,boathull,watersurface);
        My = length * integral2(funy,negwater,poswater,boathull,watersurface);
        Mz = length * integral2(funz,negwater,poswater,boathull,watersurface);
        %subarea = 10;
    end


else    

    %calculates the intersection of the deck with the water

    deckwater = @(y) watersurface(y) - deck(y);
    deckhitwater = fzero(deckwater, 5);


    %checking for two cases when over 90    


    if deckhitwater > negwater
        totalmass = length*(integral2(fun,deckhitwater,poswater,watersurface,deck) + integral2(fun,poswater,posboatdeck,boathull,deck));
        My = length*(integral2(funy,deckhitwater,poswater,watersurface,deck) + integral2(funy,poswater,posboatdeck,boathull,deck));
        Mz = length*(integral2(funz,deckhitwater,poswater,watersurface,deck) + integral2(funz,poswater,posboatdeck,boathull,deck));
    else
        totalmass = length*(integral2(fun,negboatdeck,negwater,boathull,deck) + integral2(fun,negwater,poswater,watersurface,deck)+ integral2(fun,poswater,posboatdeck,boathull,deck));
        My = length*(integral2(funy,negboatdeck,negwater,boathull,deck) + integral2(funy,negwater,poswater,watersurface,deck)+ integral2(funy,poswater,posboatdeck,boathull,deck));
        Mz = length*(integral2(funz,negboatdeck,negwater,boathull,deck) + integral2(funz,negwater,poswater,watersurface,deck)+ integral2(funz,poswater,posboatdeck,boathull,deck));
    end


end   


COB = 1:2;
COB(1) = My./totalmass;
COB(2) = Mz./totalmass;


end