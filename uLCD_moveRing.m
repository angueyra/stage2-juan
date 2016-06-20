function uLCD_moveRing(idLCD,stX,stY,fX,fY,rInner,rOuter,frames)
% function uLCD_moveRing(idLCD,stX,stY,fX,fY,rInner,rOuter,speed)
% clear Screen
% fwrite(idLCD,hex2dec('FF'));
% fwrite(idLCD,hex2dec('82'));

fwrite(idLCD,[255,82]);

deltaX=abs(stX-fX)/frames;
deltaY=abs(stY-fY)/frames;

for f=0:frames
    if f>0
        blackCircle(idLCD,stX+(deltaX*(f-1)),stY+(deltaY*(f-1)),rOuter);
    end
whiteCircle(idLCD,stX+(deltaX*f),stY+(deltaY*f),rOuter);
blackCircle(idLCD,stX+(deltaX*f),stY+(deltaY*f),rInner);

end

end


function whiteCircle(idLCD,X,Y,r)
fwrite(idLCD,hex2dec('FF'));fwrite(idLCD,hex2dec('77'));
fwrite(idLCD,00);fwrite(idLCD,X);
fwrite(idLCD,00);fwrite(idLCD,Y);
fwrite(idLCD,00);fwrite(idLCD,r);
fwrite(idLCD,255);fwrite(idLCD,255);
end

function blackCircle(idLCD,X,Y,r)
fwrite(idLCD,hex2dec('FF'));fwrite(idLCD,hex2dec('77'));
fwrite(idLCD,00);fwrite(idLCD,X);
fwrite(idLCD,00);fwrite(idLCD,Y);
fwrite(idLCD,00);fwrite(idLCD,r);
fwrite(idLCD,0);fwrite(idLCD,0);
end
