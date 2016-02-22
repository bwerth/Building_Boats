function [negboatdeck,posboatdeck,negwater,poswater,deckhitwater] = myfunction(theta, n, d , COM, COB)  
    %calculates the intersection of the boathull and the deck
    boathull = @(y) 17*abs(y/17).^n;
    deck = @(y) 17;
    boatdeck = @(y) boathull(y)-deck(y);
    negboatdeck = fzero(boatdeck,-5);
    posboatdeck = fzero(boatdeck,5);
    %calculates the intersection of boathull and water
    watersurface =@(y) (17 - d) + tand(theta)*y;
    watertop = @(y) boathull(y) - watersurface(y);
    negwater = fzero(watertop,-50);
    poswater = fzero(watertop,50);
%      if isnan(negwater) == 1
%          return
%      end
%         if d < 0
%             res = -1000;
%         else
%             res = 1000;
%         end
     %calculates the intersection of the deck with the water
     deckwater = @(y) watersurface(y) - deck(y);
     deckhitwater = fzero(deckwater, 5);   
%     x = sym('x');
%     boathullprox = x^n;
%     watersurfaceprox = 17-d + tand(theta)*x;
%     func = boathullprox - watersurfaceprox;
%     figure(1)
%     hold on
%     ezplot(boathullprox);
%     ezplot(watersurfaceprox);
%     p = sym2poly(func);
%     roots_p = roots(double(p))
%     roots_p = roots_p(imag(roots_p)==0);
% 
% 
%     negwater = min(roots_p)
%     poswater = max(roots_p);
%      for y = -9:.1:9
%          hold on;
%          plot(y,boathull(y),'g.')
%          plot(y, watersurface(y), 'b.')
%          plot(y, deck(y), 'g.')
%          plot(negboatdeck, 17 ,  'rx')
%          plot(posboatdeck, 17, 'r*')
%          plot(negwater, boathull(negwater),'b+')
%          plot(poswater, boathull(poswater), 'b+')
%          plot(deckhitwater, 17, 'ko')
%          plot(COM(1), COM(2), 'c*');
%          plot([negwater, poswater], [boathull(negwater), boathull(poswater)],'m');
%          plot(COB(1), COB(2),'k*');
%          plot([0,0],[0,300]);
%          axis([-20 20 -10 30]);
%          axis image
%          
%          
%      end
    % keyboard;    
         
        
end