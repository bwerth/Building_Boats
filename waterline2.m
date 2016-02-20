function y = waterline2(theta,n, estimate)



%y = submerged(10);




    
y = 1:3;
y(1) = fzero(@submerged,estimate); 
y(2) = negwater;
y(3) = poswater;



function res = submerged(d)
    y=0;
    funboat = @(y,z) .0317*z./z; %g/cm^3
    funwater = @(y,z) 1.0*z./z;
    
    
    
    %calculates the two corners of the boat

    boathull = @(y) 12.5*(abs(y)/4.5).^n;
    deck = @(y) 17 *y./y;
    length= 30;
    boatdeck = @(y) boathull(y)-deck(y);
    negboatdeck = fzero(boatdeck,-5);
    posboatdeck = fzero(boatdeck,5);
    
    
  
    %Calculates weight of boat
    totalweight = length*integral2(funboat,negboatdeck,posboatdeck,boathull,deck)+1120;
    
    
    %calculates the intersection of boathull and water
    
    watersurface =@(y) (17 - d) + tand(theta)*y;
    
  
    x = sym('x');
    boathullprox = x^n;
    watersurfaceprox = 17-d + tand(theta)*x;
    func = boathullprox - watersurfaceprox;
    p = sym2poly(func);
    roots_p = roots(double(p));
    roots_p = roots_p(imag(roots_p)==0);

    

    negwater = min(roots_p);
    poswater = max(roots_p);
    
    
    


    submass = 0; 
    
    
    
        
        %Checking for the angles

        if theta == 0
            submass = length*integral2(funwater,negwater,poswater,boathull,watersurface,'method','iterated');
            res = totalweight - submass;

        elseif theta < 90

            %calculates the intersection of the deck with the water
            deckwater = @(y) watersurface(y) - deck(y);
            deckhitwater = fzero(deckwater, 5);
            
            if isnan(deckhitwater)
                if d < 0
                    res = -1000;
                else
                    res = 1000;
                end
            else   

                %checking for two cases when below 90

                if deckhitwater < poswater
                     submass = length * (integral2(funwater,negwater, deckhitwater, boathull, watersurface, 'method','iterated') + integral2(funwater, deckhitwater, posboatdeck, boathull, deck, 'method','iterated'));
                    %subarea = 50;
                else    
                    submass = length * integral2(funwater,negwater,poswater,boathull,watersurface, 'method','iterated');
                    %subarea = 10;
                end
                
                res = totalweight-submass;
            end


        else    

            %calculates the intersection of the deck with the water

            deckwater = @(y) watersurface(y) - deck(y);
            deckhitwater = fzero(deckwater, 5);


            if isnan(deckhitwater)
                if d < 0
                    res = -1000;
                else
                    res = 1000;
                end
            else   
                %checking for two cases when over 90    


                if deckhitwater > negwater && deckhitwater < poswater
                    submass = length*(integral2(funwater,deckhitwater,poswater,watersurface,deck,'method','iterated') + integral2(funwater,poswater,posboatdeck,boathull,deck,'method','iterated'));
                    %submass = 1;

                elseif deckhitwater < negwater
                    submass = length*(integral2(funwater,negboatdeck,negwater,boathull,deck, 'method','iterated') + integral2(funwater,negwater,poswater,watersurface,deck, 'method','iterated')+ integral2(funwater,poswater,posboatdeck,boathull,deck, 'method','iterated'));
                    %submass = -1;


                end
                
                res = totalweight-submass;
            end


        end   
        
        
     
    %keyboard;
    
    %res = submass;
    

end
end