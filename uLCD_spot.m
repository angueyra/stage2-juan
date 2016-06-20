function uLCD_spot(idLCD,centerX,centerY,rad,color)
% function uLCDring(centerX,centerY,rInner,rOuter)
if isempty(color)
    hexcol1=255;
    hexcol2=255;
end
fwrite(idLCD,hex2dec('FF'));
fwrite(idLCD,hex2dec('82'));
% Clears screen and creates white ring
centerX(centerX>220)=220/2;
centerY(centerY>220)=220/2;

% Outer circle
fwrite(idLCD,hex2dec('FF'));fwrite(idLCD,hex2dec('77'));
fwrite(idLCD,00);fwrite(idLCD,centerX);
fwrite(idLCD,00);fwrite(idLCD,centerY);
fwrite(idLCD,00);fwrite(idLCD,rad);
fwrite(idLCD,hexcol1);fwrite(idLCD,hexcol2);
end
