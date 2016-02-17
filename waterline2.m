function y = waterline2(theta,n)

y = fzero(@submerged,10);

% for i = 0:.5:16.9 
%     hold on ;
%     diff = submerged(i);
%     plot(i, diff, 'x')
% end  


%y = submerged(10);
function res=submerged(d)
    y=0;
    funboat = @(y,z).0317*z./z;
    funwater = @(y,z) 1.0*z./z;
    
    
    
    %calculates the two corners of the boat

    boathull = @(y)1/(n^n)* abs(y).^n;
    deck = @(y) 17 *y./y;
    length=35;
    boatdeck = @(y) boathull(y)-deck(y);
    negboatdeck = fzero(boatdeck,-5);
    posboatdeck = fzero(boatdeck,5);
    
    
    %calculates the intersection of boathull and water
    
    watersurface =@(y) (17 - d) + tand(theta)*y;
    watertop = @(y) boathull(y) - watersurface(y);
    negwater = fzero(watertop, -10);
    poswater = fzero(watertop, 10);
    
    %Calculates weight of boat
    totalweight = length*integral2(funboat,negboatdeck,posboatdeck,boathull,deck)+1120;

    %calculates the intersection of the deck with the water

    deckwater = @(y) watersurface(y) - deck(y);
    deckhitwater = fzero(deckwater, 5);
        
    
    if theta == 0
        subarea = length*integral2(funwater,negwater,poswater,boathull,watersurface);
    elseif theta < 90
        
    
        
        %plot for visual
        
%          for y = -9:.1:9
%              hold on;
%              plot(y,boathull(y),'g*')
%              plot(y, watersurface(y), 'b')
%              plot(y, deck(y), 'g*')
%              plot(negboatdeck, 17 ,  'rx')
%              plot(posboatdeck, 17, 'r*')
%              plot(negwater, boathull(negwater),'b*')
%              plot(poswater, boathull(poswater), 'bx')
%              plot(deckhitwater, 17, 'ko')
% 
%              plot([negwater, poswater], [boathull(negwater), boathull(poswater)],'m')
% 
%         end
        
        %checking for two cases when below 90
        
        if deckhitwater < poswater
             subarea = length * (integral2(funwater,negwater, deckhitwater, boathull, watersurface) + integral2(funwater, deckhitwater, posboatdeck, boathull, deck));
            %subarea = 50;
        else    
            subarea = length * integral2(funwater,negwater,poswater,boathull,watersurface);
            %subarea = 10;
        end
        
        
    else    
            
%         for y = -9:.1:9
%              hold on;
%              plot(y,boathull(y),'g*')
%              plot(y, watersurface(y), 'b')
%              plot(y, deck(y), 'g*')
%              plot(negboatdeck, 17 ,  'rx')
%              plot(posboatdeck, 17, 'r*')
%              plot(negwater, boathull(negwater),'b*')
%              plot(poswater, boathull(poswater), 'bx')
%              plot(deckhitwater, 17, 'ko')
% 
%              plot([negwater, poswater], [boathull(negwater), boathull(poswater)],'m')
%              
%         end  
        
        if deckhitwater > negwater
            subarea = length*(integral2(funwater,deckhitwater,poswater,watersurface,deck) + integral2(funwater,poswater,posboatdeck,boathull,deck));
        else
            subarea = length*(integral2(funwater,negboatdeck,negwater,boathull,deck) + integral2(funwater,negwater,poswater,watersurface,deck)+ integral2(funwater,poswater,posboatdeck,boathull,deck));
        end
        
       
     end   
    %keyboard;
    res = totalweight-subarea;
    %res = subarea;
    

end
end