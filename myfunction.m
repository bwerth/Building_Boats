function res = myfunction(theta, n, d)  




    boathull = @(y) 1/(n^n)*abs(y).^n;
    deck = @(y) 17;
    length=35;
    boatdeck = @(y) boathull(y)-deck(y);
    negboatdeck = fzero(boatdeck,-5);
    posboatdeck = fzero(boatdeck,5);
    
    
    %calculates the intersection of boathull and water
    
    watersurface =@(y) (17 - d) + tand(theta)*y;
    watertop = @(y) boathull(y) - watersurface(y);
    negwater = fzero(watertop, -10);
    poswater = fzero(watertop, 10);
    
     %calculates the intersection of the deck with the water

        deckwater = @(y) watersurface(y) - deck(y);
        deckhitwater = fzero(deckwater, 5);
        
        
        
     for y = -9:.1:9
         hold on;
         plot(y,boathull(y),'g*')
         plot(y, watersurface(y), 'b')
         plot(y, deck(y), 'g*')
         plot(negboatdeck, 17 ,  'rx')
         plot(posboatdeck, 17, 'r*')
         plot(negwater, boathull(negwater),'b*')
         plot(poswater, boathull(poswater), 'bx')
         plot(deckhitwater, 17, 'ko')
         
         plot([negwater, poswater], [boathull(negwater), boathull(poswater)],'m')
         
         axis([-20 20 -10 100]);
         
     end
    % keyboard;    
         
        
end



        